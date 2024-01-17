rm build/ -rf
rm install/ -rf
cmake --preset config_simple -S .
cmake --build preset_build --preset build_simple
cmake --install preset_build