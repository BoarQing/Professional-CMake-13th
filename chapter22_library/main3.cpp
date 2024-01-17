#include "print3.hpp"
#include <iostream>
int main() {
  print3();

#ifdef HAVE_SSL
  std::cout << "HAVE_SSL" << std::endl;
#endif
  return 0;
}