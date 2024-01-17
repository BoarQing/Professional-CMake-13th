rm build/ -rf
cmake -S . -B build/ --log-context
cmake --build build/
cmake --build build/ --target printGenex