#include "dynamic_lib.hpp"
#include "static_lib.hpp"
int GetXDyna() { return GetX(); }
int *GetXDynaAddress() { return GetXAddress(); }