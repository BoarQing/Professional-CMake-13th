rm install/ -rf
rm build/ -rf
cmake -S . -B build/ -DCMAKE_INSTALL_PREFIX=./install
cmake --build build/
cmake --install build/