cmake_minimum_required(VERSION 3.22.1)
project(project_variable
		VERSION 1.0.0
		LANGUAGES C CXX)

set(myVar a b c)
#note message(${myVar}) would output abc
#because message(${myVar}) = message(a b c)
#and message("${myVar}") = message("a b c")
message("${myVar}")
message("a b c d")
message(a;b;c;d)
set(myVar "a b c")
message("${myVar}")
set(myVar a "b c")
message("${myVar}")
set(myVar1 ${myVar} a)
message("${myVar1}")
set(myVar1 "${myVar} a")
message("${myVar1}")
