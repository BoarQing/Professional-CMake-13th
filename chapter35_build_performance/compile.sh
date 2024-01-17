rm build/ -rf
cmake  -S . -B build/ -DCMAKE_UNITY_BUILD=ON
cmake --build build/