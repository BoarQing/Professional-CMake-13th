#the current cmake version, the code should always behave like 3.22.1
cmake_minimum_required(VERSION 3.22.1)
project(project_custom_tasks
        VERSION 1.0.0
        LANGUAGES C CXX)


add_executable(print_arg print_arg.cpp)

# no one dependendent on it 
add_custom_target(print_not_trigger
    COMMAND print_arg "Hello\n")
#called twice
add_custom_target(print_trigger
    ALL
    COMMAND print_arg "Hello2\n")

add_custom_command(TARGET print_arg POST_BUILD
    COMMAND ls -l $<TARGET_FILE:print>
)

add_executable(print_new print_a_new_file.cpp)
#only called once, the second time print.cpp is already exist
add_custom_command(OUTPUT print.cpp
    COMMAND print_new > print.cpp
    COMMAND echo "called custom command"
)

add_executable(print ${CMAKE_CURRENT_BINARY_DIR}/print.cpp)

execute_process(
    COMMAND echo "called during config!!!"
)

execute_process(
    COMMAND cmake -E --help
)