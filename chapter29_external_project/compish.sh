rm build/ -rf
rm install/ -rf
rm zlib/ -rf
rm libpng/ -rf
cmake  -S . -B build/
cmake --build build/