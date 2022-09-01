# webassembly-tutorial
 Tutorial on using WebAssembly

## Installation
[Installation guide](https://emscripten.org/docs/getting_started/downloads.html#sdk-download-and-install)
1. Run the following commands in the directory you want to store the library in (*This uses `C:\src` as my path*):
```
cd C:\src # replace with your directory
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
```
2. Add `C:\src\emsdk` to the `PATH` environment variable
3. Restart your terminal session
4. Run the command `emsdk --help` to ensure the library has been installed properly.