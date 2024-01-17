#include "print_dep.hpp"
#include <iostream>

std::string GetString(const Point &pt) {
  return std::to_string(pt.x) + " " + std::to_string(pt.y);
}

void Print(const struct Point &pt) { std::cout << GetString(pt) << std::endl; }

int main(int argv, char *argc[]) {
  struct Point pt = {1, 2};
  Print(pt);
  // error if uncomment
  // Foo();
}