let types = {
    char: 1,
    short: 2,
    int: 4,
    float: 4,
    pointer: 4,
    double: 8,
    long: 8,
    string: 4
}

let primitives = ["char", "short", "int", "float", "pointer", "double", "long", "string"];

let structs = {}

function registerStruct(name, structFormat) {
    structs[name] = structFormat;
    types[name] = compSize(structFormat);
}

function compSize(structFormat) {
    let size = 0;
    for (const [key, value] of Object.entries(structFormat)) {
        switch (typeof(value)) {
            case "string":
                size += types[value];
                break;
            case "object":
                size += compSize(value);
                break;
        }
    }
    return size;
}

function encodeArray(arr, len, sizeof = 1) {
    var ptr;
    var out;
    if (sizeof == 8) {
        ptr = exports.wasmmalloc(len * 8);
        out = new BigUint64Array(memory.buffer, ptr);
    }
    else if (sizeof == 4) {
        ptr = exports.wasmmalloc(len * 4);
        out = new Uint32Array(memory.buffer, ptr);
    }
    else {
        ptr = exports.wasmmalloc(len);
        out = new Uint8Array(memory.buffer, ptr);
    }

    for (var i = 0; i < len; i++) {
        out[i] = arr[i];
    }

    return ptr;
}

function encodeNum(num, n, memory, cursor = 0) {
    for (var i = 0; i < n; i++) {
        memory[i + cursor] = num & 0xff;
        num >>= 8;
    }
}

function encodeStruct(name, struct, memory, malloc) {
    var ptr = malloc(types[name]);
    memory = new Uint8Array(memory.buffer, ptr);

    var cursor = 0;
    for (const [key, value] of Object.entries(structs[name])) {
        encodeNum(struct[key] ? struct[key] : 0, types[value], memory, cursor);
        cursor += types[value];
    }

    return ptr;
}

function decodeNum(n, memory, cursor = 0) {
    let ret = 0;
    for (var i = n - 1; i >= 0; i--) {
        ret <<= 8;
        ret |= memory[i + cursor];
    }
    return ret;
}

function decodeString(ptr, memory) {
    var bytes = new Uint8Array(memory.buffer, ptr);
    var strlen = 0;
    while (bytes[strlen] != 0) strlen++;

    return new TextDecoder("utf8").decode(bytes.slice(0, strlen));
}

function decodeStruct(name, ptr, memory) {
    memory = new Uint8Array(memory.buffer, ptr, types[name]);
    let cursor = 0;

    var ret = {};
    for (const [key, value] of Object.entries(structs[name])) {
        if (primitives.includes(value)) {
            ret[key] = decodeNum(types[value], memory, cursor);
            if (value === "string") {
                ret[key] = decodeString(ret[key], memory);
            }
        }
        else {
            ret[key] = decodeStruct(value, ptr + cursor, memory);
        }
        
        cursor += types[value];
    }
    return ret;
}