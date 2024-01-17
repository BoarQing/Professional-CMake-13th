cmake_minimum_required(VERSION 3.22.1)
project(project_file_manipulation
        VERSION 1.0.0
        LANGUAGES C CXX)

execute_process(
    COMMAND cmake -E copy_if_different "a_simple_text_file.txt" ${CMAKE_CURRENT_BINARY_DIR}
    COMMAND cmake -E copy_if_different "a_simple_bash.sh" ${CMAKE_CURRENT_BINARY_DIR}
)

set(mod_file "${CMAKE_CURRENT_BINARY_DIR}/a_simple_text_file.txt")
set(mod_bash "${CMAKE_CURRENT_BINARY_DIR}/a_simple_bash.sh")

set(msg "Hello world")
file(WRITE ${mod_file} ${msg})

# this would overwrite hello world
file(WRITE ${mod_file} [[
First line
Second line
Third line
]])

# [=[ for no variable replacement
file(WRITE ${mod_bash} [=[
#!/bin/bash
[[ -n "${USER}" ]] && echo "Have USER"
]=])


# at the end of configuration stage becausae of the generator expression
file(GENERATE
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/outFile-$<CONFIG>.txt
    INPUT "a_simple_text_file.txt"
    CONDITION $<NOT:$<CONFIG:Release>>
)

file(READ "a_simple_text_file.txt" read_out OFFSET 4 LIMIT 10)
message("$read file output: ${read_out}")

file(STRINGS "a_simple_text_file.txt" read_out
    LENGTH_MAXIMUM 4
    LENGTH_MINIMUM 2)
message("$string file output: ${read_out}")

# return the entire line, not the only the pattern
file(STRINGS "a_simple_text_file.txt" rex_line
  REGEX "a.*"
)
message("$string file regex output: ${rex_line}")

set(new_dir "${CMAKE_CURRENT_BINARY_DIR}/mkdir")
file(MAKE_DIRECTORY ${new_dir})
execute_process(
    COMMAND cmake -E copy_if_different "a_simple_text_file.txt" ${new_dir}
)
file(RENAME ${new_dir} "${new_dir}_hey")
# or REMOVE for single for file
file(REMOVE_RECURSE "${new_dir}_hey")
# use cmake -E for build time

file(CREATE_LINK "a_simple_text_file.txt" "${CMAKE_CURRENT_BINARY_DIR}/txt.lk")
# CHMOD_RECURSE
file(CHMOD "${CMAKE_CURRENT_BINARY_DIR}/txt.lk"
    PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE # FILE_PERMISSIONS # DIRECTORY_PERMISSIONS
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
)