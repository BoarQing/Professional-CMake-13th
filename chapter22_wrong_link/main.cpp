#include "dynamic_lib.hpp"
#include "static_lib.hpp"
#include <iostream>
int main() {
  GetXDyna();
  GetXDyna();
  // different X on Windows, same on Linux.
  // Need set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON), __declspec(dllexport)
  // __declspec(dllimport)!
  std::cout << "Dynamic X = " << GetXDyna() << std::endl;
  std::cout << "Static X = " << GetX() << std::endl;
  std::cout << "Dynamic Address X = " << GetXDynaAddress() << std::endl;
  std::cout << "Static Address X = " << GetXAddress() << std::endl;
}