rm build/ -rf
rm install/ -rf
cmake  -S . -B build/ -DCMAKE_INSTALL_PREFIX=./install -DCMAKE_BUILD_TYPE:STRING=Release
cmake --build build/
cmake --install build