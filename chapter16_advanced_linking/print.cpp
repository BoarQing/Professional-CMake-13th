#include "print.hpp"
#include "print_dep.hpp"
#include <iostream>

void Print(struct Point &pt) { std::cout << GetString(pt) << std::endl; }

void Add(struct Point &pt) {
  pt.x++;
  pt.y++;
}