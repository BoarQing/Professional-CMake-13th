#include "print.hpp"
#include "print_dep.hpp"
#include <iostream>

void Print(const struct Point &pt) { std::cout << GetString(pt) << std::endl; }