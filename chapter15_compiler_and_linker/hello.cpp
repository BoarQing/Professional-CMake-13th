
#include "print.hpp"
#include "print_dep.hpp"
int main(int argv, char *argc[]) {
  struct Point pt = {1, 2};
#ifdef NEWPT
  pt.x = 3;
  pt.y = 5;
#endif
#ifdef INCRE
  pt.x++;
  pt.y++;
#endif
  Print(pt);
}