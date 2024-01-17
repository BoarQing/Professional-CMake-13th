cmake_minimum_required(VERSION 3.22.1)
project(language_requirements
        VERSION 1.0.0
        LANGUAGES C CXX)

add_executable(print print.cpp)
# Define the foo_OVERRIDE symbol so it provides the
# override keyword if available or empty otherwise
target_compile_definitions(print PRIVATE
  $<$<COMPILE_FEATURES:cxx_override>:my_OVERRIDE=override>
  $<$<NOT:$<COMPILE_FEATURES:cxx_override>>:my_OVERRIDE>
)

add_custom_command(TARGET print POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E echo 
  "COMPILE_FEATURES:cxx_override evaluated to = $<COMPILE_FEATURES:cxx_override>")