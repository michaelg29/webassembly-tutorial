# webassembly-tutorial
 Tutorial on using WebAssembly

## Installation
[Installation guide](https://emscripten.org/docs/getting_started/downloads.html#sdk-download-and-install)
1. Run the following commands in the directory you want to store the library in (*This uses `C:\src` as my path*):
```
cd $LibraryDirectory # replace with your directory
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
```
2. Add `$LibraryDirectory\emsdk` to the `PATH` environment variable
3. Restart your terminal session
4. Run the command `emsdk --help` to ensure the library has been installed properly.
### Compiling
1. In a directory, create a c file (`test.c`) and write some code.
2. Open up the terminal to that directory and execute the following commands.
```
emsdk activate latest
emcc test.c
```
3. Open up the output `test.html` file in a browser and view the output.

## WebAssembly Tools Suite
### Wasm suite: [wabt](https://github.com/webassembly/wabt)
```
cd $LibraryDirectory # go to your target directory
git clone --recursive https://github.com/WebAssembly/wabt
cd wabt
git submodule update --init
```

* Add the value: `$LibraryDirectory\wabt\bin` to your PATH environment variable.

### CMake: [download](https://cmake.org/download/)
```
cd $LibraryDirectory\wabt
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_INSTALL_PREFIX=..\ -G "Visual Studio 16 2019"
cmake --build . --config DEBUG --target install
```

### Testing
* Ensure that the `bin` directory exists with a bunch of executable files.
* Restart your terminal session, and navigate to a directory containing a .wasm file
* Run the command `wasm2wat --help`, make sure it prints some output
* Test the tool using a file (i.e. `wasm2wat exported.wasm`)

### Updating
There may come a day when you get an error in using a wabt tool, something like `Bad magic value`. In this case, you need to update your toolset. To do this, we need to pull new code from GitHub then rebuild with CMake as follows:
```
cd $LibraryDirectory\wabt
git pull
cd build
cmake .. -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_INSTALL_PREFIX=..\ -G "Visual Studio 16 2019"
cmake --build . --config DEBUG --target install
```

## Helpful resources
* [MDN handbook](https://developer.mozilla.org/en-US/docs/WebAssembly)
### Writing WebAssembly Text format (WAT)
* [MDN](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format)
* [MDN basic examples](https://github.com/mdn/webassembly-examples)
* [Basic examples](https://blog.ttulka.com/learning-webassembly-3-wat-programming-basics/)
* [Game of Life example](https://blog.scottlogic.com/2018/04/26/webassembly-by-hand.html)
* [packthub](https://hub.packtpub.com/the-elements-of-webassembly-wat-and-wasm-explained-tutorial/)
