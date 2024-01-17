cmake_language(DEFER
    DIRECTORY ${CMAKE_SOURCE_DIR}
    CALL message "called after finish but cancelled")
cmake_language(DEFER
    DIRECTORY ${CMAKE_SOURCE_DIR}
    CALL message "called after finish")

cmake_language(DEFER
    DIRECTORY ${CMAKE_SOURCE_DIR}
    GET_CALL_IDS deferCalls)
message("defer calls are ${deferCalls}")
cmake_language(DEFER
    DIRECTORY ${CMAKE_SOURCE_DIR}
    GET_CALL id deferCall)
message("defer calls are ${deferCall}")
cmake_language(DEFER
    DIRECTORY ${CMAKE_SOURCE_DIR}
    CANCEL_CALL ${deferCalls})

function(calledFunc arg)
    message("calledFunc called with arg = ${arg}")
endfunction()
cmake_language(CALL "calledFunc" "hello")

set(funcVar [=[
    message("a variable being called")
]=])

cmake_language(EVAL CODE ${funcVar})
