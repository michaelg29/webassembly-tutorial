let types = {
    char: 1,
    int: 4,
    float: 4,
}

let primitives = ["char", "int", "float"];

let structs = {};

function registerStruct(name, structFormat) {
    types[name] = computeStructSize(structFormat);
    structs[name] = structFormat;
}

function getElemSize(type) {
    if (type.endsWith('*') || type.endsWith('[]')) {
        return 4;
    } else {
        return types[type];
    }
}

function computeStructSize(structFormat) {
    let size = 0;

    for (const type of Object.values(structFormat)) {
        size += getElemSize(type);
    }

    return size;
}

function encodeInt(num, n, buffer, offset = 0) {
    for (var i = 0; i < n; i++) {
        buffer[i + offset] = num & 0xff;
        num >>= 8;
    }
}

function encodeStruct(type, obj, buffer, memory, malloc, cursor = 0, pointer = 0) {
    for (const [name, elemType] of Object.entries(structs[type])) {
        encodeElem(elemType, obj[name], buffer, memory, malloc, cursor, pointer);

        cursor += getElemSize(elemType);
    }
}

function encodePointer(type, obj, memory, malloc) {
    if (!obj) {
        return 0; // NULL
    }

    const n = getElemSize(type);
    const ptr = malloc(n);
    const buf = new Uint8Array(memory.buffer, ptr, n);

    encodeElem(type, obj, buf, memory, malloc, 0, ptr);
    return ptr;
}

function encodeArray(type, obj, memory, malloc) {
    if (!obj) {
        return 0; // NULL
    }

    const nIndividual = getElemSize(type);
    const n = (obj.length + 1) * nIndividual;
    const ptr = malloc(n);
    const buf = new Uint8Array(memory.buffer, ptr, n);
    if (type === 'char') {
        for (var i = 0; i < obj.length; i++) {
            buf[i] = obj.charCodeAt(i);
        }
        buf[obj.length] = 0;
    } else {
        let cursor = 0;
        for (var i = 0; i < obj.length; i++) {
            encodeElem(type, obj[i], buf, memory, malloc, cursor, ptr);
            cursor += nIndividual;
        }
        encodeInt(0, nIndividual, buf, cursor); // terminator element
    }

    return ptr;
}

function encodeElem(type, obj, buffer, memory, malloc, cursor = 0, pointer = 0) {
    if (type.endsWith('*')) {
        const ptr = encodePointer(type.substring(0, type.length - 1), obj, memory, malloc);
        encodeInt(ptr, 4, buffer, cursor);
    } else if (type.endsWith('[]')) {
        const ptr = encodeArray(type.substring(0, type.length - 2), obj, memory, malloc);
        encodeInt(ptr, 4, buffer, cursor);
    } else if (primitives.includes(type)) {
        if (type !== 'float') {
            encodeInt(obj ?? 0, types[type], buffer, cursor);
        } else {
            const floatBuf = new Float32Array(memory.buffer, pointer + cursor);
            floatBuf[0] = obj ?? 0.0;
        }
    } else {
        encodeStruct(type, obj, buffer, memory, malloc, cursor, pointer);
    }
}

function decodeNum(n, memory, offset = 0) {
    let ret = 0;
    for (var i = n - 1; i >= 0; i--) {
        ret <<= 8;
        ret |= memory[i + offset];
    }
    return ret;
}

function decodeStruct(name, memory, offset = 0) {
    var ret = {};
    let cursor = offset;
    for (const [key, type] of Object.entries(structs[name])) {
        if (primitives.includes(type)) {
            ret[key] = decodeNum(types[type], memory, cursor);
        } else {
            ret[key] = decodeStruct(type, memory, cursor);
        }

        cursor += types[type];
    }
    return ret;
}

function startDecodeStruct(name, ptr, memory) {
    return decodeStruct(name, new Uint8Array(memory.buffer, ptr, types[name]));
}