#include "file_reader.hpp"
#include <iostream>
int main() {
  if (check()) {
    std::cout << "found rpath" << std::endl;
  } else {
    std::cout << "not found rpath" << std::endl;
  }
  return 0;
}