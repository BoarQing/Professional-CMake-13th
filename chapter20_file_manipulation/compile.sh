rm build/ -rf
cmake  -S . -B build/ -DCMAKE_BUILD_TYPE:STRING=Debug
cmake --build build/