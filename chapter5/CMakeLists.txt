cmake_minimum_required(VERSION 3.22.1)
project(project_variable
		VERSION 1.0.0
		LANGUAGES C CXX)

#nested variables
set(myVar a b c)
#note message(${myVar}) would output abc
#because message(${myVar}) = message(a;b;c) #see the behavior of message function about concatenating its argument
#and message("${myVar}") = message("a;b;c")
set(myVar "a b c")
message("${myVar}")
set(myVar a "b c")
message("${myVar}")
set(myVar1 ${myVar} a)
message("${myVar1}")
set(myVar1 "${myVar} a")
message("${myVar1}")

#escaping char
set(myVar2 "goes here")
set(multiLine "First line ${myVar2}
Second line with a \"quoted\" word")
message(${multiLine})

set(myVar3 [[

]])


