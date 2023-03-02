function(argFunc namedArg)
    message("named_arg = ${namedArg}")
    message("argc = ${ARGC}")
    message("argv = ${ARGV}")
    foreach(i RANGE 0 ${ARGC})
        message("ARGV${i} = ${ARGV${i}}")
    endforeach()
    message("argn = ${ARGN}")

endfunction()

argFunc(hello word1 word2 word3)

macro(argMacr namedArg)
    message("named_arg = ${namedArg}")
    message("argc = ${ARGC}")
    message("argv = ${ARGV}")
    message("argn = ${ARGN}")
endmacro()

argMacr(hello word1 word2 word3)

macro(listCanNotFindARGN)
  # LISTS can not find ARGN in macro
  # because ARGN is not variable
  foreach(arg IN LISTS ARGN)
  message("Found external variable: ${arg}")
  endforeach()
endmacro()

function(nestedFunc)
    listCanNotFindARGN(hello)
endfunction()
nestedFunc(hello word1 word2 word3)

function(nestedFunc)
    set(ARGN hello word1) #now ARGN is set
    listCanNotFindARGN(hello)
endfunction()
nestedFunc(hello word1 word2 word3)