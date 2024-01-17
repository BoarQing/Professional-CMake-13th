rm build/ -rf
rm install/ -rf
# Release-config
cmake  -S . -B build/ -DCMAKE_BUILD_TYPE:STRING=Release
cmake --build build/
cmake --build build/ --target all_verify_interface_header_sets
cmake --install build
./install/runtime/main