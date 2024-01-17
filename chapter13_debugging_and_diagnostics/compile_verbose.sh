rm build/ -rf
cmake -S . -B build/ --log-context --log-level=VERBOSE
cmake --build build/
cmake --build build/ --target printGenex