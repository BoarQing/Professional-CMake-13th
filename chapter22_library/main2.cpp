#include "print.hpp"
#include "print2.hpp"
#include <iostream>
int main() {
  print();
  print2();

#ifdef HAVE_SSL
  std::cout << "HAVE_SSL" << std::endl;
#endif
  return 0;
}