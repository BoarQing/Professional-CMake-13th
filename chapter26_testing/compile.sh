rm build/ -rf
cmake  -S . -B build/
cmake --build build/
ctest --test-dir build/ -j 5
ctest --test-dir build/ -L env