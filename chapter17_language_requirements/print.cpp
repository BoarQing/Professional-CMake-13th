#include <iostream>

class Base {
public:
  virtual void print() { std::cout << "Base Hey" << std::endl; }
};

class Child : public Base {
public:
  // replace my_OVERRIDE to override or nothing
  virtual void print() my_OVERRIDE { std::cout << "Child Hey" << std::endl; }
};

int main(int argv, char *argc[]) {
  Base b = Base();
  Child c = Child();
  b.print();
  c.print();
}