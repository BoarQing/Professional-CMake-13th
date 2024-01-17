#include "static_lib.hpp"
int __attribute__((visibility("hidden"))) x = 10;
int GetX() {
  ++x;
  return x;
}
int *GetXAddress() { return &x; }