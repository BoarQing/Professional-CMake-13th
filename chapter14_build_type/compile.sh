rm build-Debug/ -rf
rm build-RelWithDebInfo/ -rf 
rm build-Release/ -rf
rm build-MinSizeRel/ -rf
rm build-Profile/ -rf

cmake -S . -B build-Debug/ -DCMAKE_BUILD_TYPE:STRING=Debug
cmake --build build-Debug/
cmake -S . -B build-RelWithDebInfo/ -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo
cmake --build build-RelWithDebInfo/
cmake -S . -B build-Release/ -DCMAKE_BUILD_TYPE:STRING=Release
cmake --build build-Release/
cmake -S . -B build-MinSizeRel/ -DCMAKE_BUILD_TYPE:STRING=MinSizeRel
cmake --build build-MinSizeRel/
cmake -S . -B build-Profile/ -DCMAKE_BUILD_TYPE:STRING=Profile
cmake --build build-Profile/