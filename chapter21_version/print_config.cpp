#include "version_config.h"
#include <iostream>

int main(int argc, char *argv[]) {
  std::cout << "VERSION = " << getversionVersion() << "\n"
            << "MAJOR = " << getversionVersionMajor() << "\n"
            << "MINOR = " << getversionVersionMinor() << "\n"
            << "PATCH = " << getversionVersionPatch() << "\n"
            << "TWEAK = " << getversionVersionTweak() << std::endl;
}