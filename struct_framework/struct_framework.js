let types = {
    char: 1,
    short: 2,
    int: 4,
    float: 4,
    double: 8,
    long: 8
}

let primitives = ["char", "short", "int", "float", "double", "long"];

let structs = {};

function registerStruct(name, structFormat) {
    types[name] = computeStructSize(structFormat);
    structs[name] = structFormat;
}

function computeStructSize(structFormat) {
    let size = 0;

    for (const type of Object.values(structFormat)) {
        size += types[type];
    }

    return size;
}

function encodeNum(num, n, buffer, offset = 0) {
    console.log(buffer, offset);
    for (var i = 0; i < n; i++) {
        buffer[i + offset] = num & 0xff;
        console.log(num, buffer[i + offset]);
        num >>= 8;
    }
}

function encodeStruct(name, obj, buffer, offset = 0) {
    let cursor = offset;
    for (const [key, type] of Object.entries(structs[name])) {
        // encode the number
        if (primitives.includes(type)) {
            encodeNum(obj[key] ?? 0, types[type], buffer, cursor);
        } else {
            encodeStruct(type, obj[key] ?? {}, buffer, cursor);
        }

        cursor += types[type];
    }
}

function startEncodeStruct(name, obj, memory, malloc) {
    var ptr = malloc(types[name]);
    console.log(ptr);
    let buf = new Uint8Array(memory.buffer, ptr, types[name]);
    console.log(memory, typeof memory.buffer);
    console.log(name, types[name], obj);

    encodeStruct(name, obj, buf);

    console.log(buf);

    return ptr;
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