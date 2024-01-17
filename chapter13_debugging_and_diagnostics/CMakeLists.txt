cmake_minimum_required(VERSION 3.22.1)
project(debugging_and_diagnostics
		VERSION 1.0.0
		LANGUAGES C CXX)

# will abort
#message(FATAL_ERROR "not found")

function(funcA)
    list(APPEND CMAKE_MESSAGE_INDENT " ")
    message(VERBOSE "enter ${CMAKE_CURRENT_FUNCTION}")
    message("${CMAKE_CURRENT_FUNCTION}")
    message(VERBOSE "exit ${CMAKE_CURRENT_FUNCTION}")
endfunction()

function(funcB)
    list(APPEND CMAKE_MESSAGE_INDENT " ")
    message(VERBOSE "enter ${CMAKE_CURRENT_FUNCTION}")
    message("${CMAKE_CURRENT_FUNCTION}")
    message(VERBOSE "exit ${CMAKE_CURRENT_FUNCTION}")
    funcA()
endfunction()

function(funcC)
    list(APPEND CMAKE_MESSAGE_INDENT " ")
    message(VERBOSE "enter ${CMAKE_CURRENT_FUNCTION}")
    message("${CMAKE_CURRENT_FUNCTION}")
    message(VERBOSE "exit ${CMAKE_CURRENT_FUNCTION}")
    funcB()
endfunction()

message("Top")
funcA()
funcB()
funcC()
message("Bottom")

list(APPEND CMAKE_MESSAGE_CONTEXT myscope)
message("Adding features\nHere we go:")
list(APPEND CMAKE_MESSAGE_CONTEXT secondscope)
message("All done")
list(POP_BACK CMAKE_MESSAGE_CONTEXT)
message("remove scope")
list(POP_BACK CMAKE_MESSAGE_CONTEXT)
message("remove scope done")


function(checkSomething resultVar)
    set(${resultVar} YES PARENT_SCOPE)
endfunction()
function(checkSomethingElse resultVar)
    set(${resultVar} NO PARENT_SCOPE)
endfunction()

# Outer check starts here
message(CHECK_START "Checking things")
list(APPEND CMAKE_MESSAGE_INDENT " ")
# Inner check 1
    message(CHECK_START "Checking support for something")
checkSomething(successVar1)
if(successVar1)
    message(CHECK_PASS "supported")
else()
    message(CHECK_FAIL "not supported")
endif()
# Inner check 2
message(CHECK_START "Checking support for something else")
checkSomethingElse(successVar2)
if(successVar2)
    message(CHECK_PASS "supported")
else()
    message(CHECK_FAIL "not supported")
endif()

add_library(MyApp print.cpp)
add_library(MyAlias ALIAS MyApp)

include(CMakePrintHelpers)
cmake_print_properties(TARGETS MyApp MyAlias
    PROPERTIES TYPE ALIASED_TARGET
)

set(foo "My variable")
unset(bar)
include(CMakePrintHelpers)
cmake_print_variables(foo bar CMAKE_VERSION)

function(set_parent_func variable result)
    message("${CMAKE_CURRENT_FUNCTION}")
    set(${variable} ${result} PARENT_SCOPE)
endfunction()

variable_watch(myVar)

set(myVar "hello")
set_parent_func(myVar "hello2")
# output to a file
set(incDirs $<TARGET_PROPERTY:MyApp,INCLUDE_DIRECTORIES>)
set(genex "-I$<JOIN:${incDirs}, -I>")
#evaluated at build time
message(${genex})
file(GENERATE OUTPUT genex.txt CONTENT "${genex}\n")

set(genex "$<IF:$<CONFIG:Debug>,is debug,not debug>")
add_custom_target(printGenex
    COMMENT "Result of generator expression:"
    COMMAND ${CMAKE_COMMAND} -E echo "${genex}"
    VERBATIM
)