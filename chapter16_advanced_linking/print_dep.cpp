#include "print_dep.hpp"
#include "print.hpp"
std::string GetString(Point &pt) {
  Add(pt);
  return std::to_string(pt.x) + " " + std::to_string(pt.y);
}
