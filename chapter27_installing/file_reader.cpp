#include "file_reader.hpp"
#include <filesystem>
namespace fs = std::filesystem;

bool check() {
  std::string filename = "./data/a.txt";
  return fs::exists(filename);
}
