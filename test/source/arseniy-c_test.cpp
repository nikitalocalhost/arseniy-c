#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "arseniy-c" ? 0 : 1;
}
