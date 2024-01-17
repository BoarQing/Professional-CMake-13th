rm build/ -rf
cmake -S . -B build/ -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES="./cmake/injected_code.cmake;./cmake/highjacked.cmake"
cmake --build build/