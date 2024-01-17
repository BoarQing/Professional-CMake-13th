rm build/ -rf
cmake -S . -B build/ --log-context | tee build/out.log
cmake --build build/
cmake --build build/ --target printGenex