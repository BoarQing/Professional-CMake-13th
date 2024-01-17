#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[]) {
  const char *val = std::getenv("test_env");
  return std::atoi(val);
}