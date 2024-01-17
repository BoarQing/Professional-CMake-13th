rm build/ -rf
mkdir build
cmake -S . -B build/ --profiling-output=build/perf.google-trace --profiling-format=google-trace
cmake --build build/