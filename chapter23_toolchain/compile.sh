rm build/ -rf
cmake  -S . -B build/ -DCMAKE_TOOLCHAIN_FILE=toolchain.cmake
cmake --build build/