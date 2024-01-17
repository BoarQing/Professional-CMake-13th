function(printSpecialVar)
    message(${CMAKE_CURRENT_FUNCTION})
    message(${CMAKE_CURRENT_FUNCTION_LIST_FILE})
    message(${CMAKE_CURRENT_FUNCTION_LIST_DIR})
    message(${CMAKE_CURRENT_FUNCTION_LIST_LINE})
endfunction()

printSpecialVar()