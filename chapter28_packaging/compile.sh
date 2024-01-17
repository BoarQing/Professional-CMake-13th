rm build/ -rf
rm install/ -rf
rm _* -rf
rm *.tar.gz
cmake  -S . -B build/ -DCMAKE_BUILD_TYPE:STRING=Release
cmake --build build/
cmake --install build
cd build
cpack -C "Release"
# inside build directory
cd ..
# source file
cpack  -G TGZ --config build/CPackSourceConfig.cmake
# need install rpm
cpack -G RPM --config build/CPackConfig.cmake