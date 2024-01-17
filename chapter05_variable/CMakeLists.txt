cmake_minimum_required(VERSION 3.22.1)
project(project_variable
		VERSION 1.0.0
		LANGUAGES C CXX)

#nested variables

#note message(${myVar}) would output abc
#because message(${myVar}) = message(a;b;c)
#see the behavior of message function about concatenating its argument
#and message("${myVar}") = message("a;b;c")

set(listVar a b c)
message("${listVar}")
#a b c
set(stringVar "a b c")
message("${stringVar}")
#a;b c
set(listStringVar a "b c")
message("${listStringVar}")
#a;b c;a
set(listConcate ${listVar} a)
message("${listConcate}")
#a;b c a
set(stringConcate "${listVar} a")
message("${stringConcate}")



#escaping char
set(str "goes here")
set(multiLine "First line ${str}
Second line with a \"quoted\" word")
message(${multiLine})



#multi-line variable
set(simpleMutliLine [[
First line
Second line
]])
message(${simpleMutliLine})

#avoid unwrapping {}
set(noNeedEscape [=[
#!/bin/bash
[[ -n "${USER}" ]] && echo "Have USER"
]=])
message(${noNeedEscape})

#equvalent to previous variable
set(needEscape
"#!/bin/bash
[[ -n \"\${USER}\" ]] && echo \"Have USER\"
")
message(${needEscape})



#concatenating env variable, note, this variable editing only when the script is running
set(ENV{PATH} "$ENV{PATH}:/opt/myDir")
message($ENV{PATH})
set(ENV{PATH} "/opt/myDir")
message($ENV{PATH})



#cache non-cache variable
set(cacheAndNonCacheVar nonCacheValue)
message("${cacheAndNonCacheVar}")
#shadow the cache val
#   var name           value                           type docstring [force]
set(cacheAndNonCacheVar ~/cachedPath /cachedPath CACHE PATH "path")
message("${cacheAndNonCacheVar}")
#does not shadow
set(cacheAndNonCacheVar "")
message("${cacheAndNonCacheVar}")
#unshadow the cache val
unset(cacheAndNonCacheVar)
message("${cacheAndNonCacheVar}")
#if second run, forceCached is already cached, so no cachedPath
set(cacheAndNonCacheVar ~/forceCached CACHE PATH "bin" FORCE)
message("${cacheAndNonCacheVar}")
#notice PATH and STRING evaluate to different thing, prefix cache variable with underscore
set(_namingForCacheVar  ~/cachedPath /cachedPath STRING "string")



#option is cached as well
option(optionalVar testing ON)
message(${optionalVar})
set(optionalVar OFF)
message(${optionalVar})
unset(optionalVar)
message(${optionalVar})
option(unsetOptionalVar testing ON)
#not in cache file
set(unsavedVar ON)
option(unsavedVar testing OFF)



string(FIND abcdefabcdef def fwdIdx)
string(FIND abcdefabcdef def revIdx REVERSE)
message(
	"fwdIdx = ${fwdIdx}\n"
	"revIdx = ${revIdx}"
)
string(REPLACE 123 456 replacedVal 123456)
message(${replacedVal})



string(REGEX MATCH "[ace]" matchOne abcdefabcdef)
string(REGEX MATCHALL "[ace]" matchAll abcdefabcdef)
#two escape
string(REGEX REPLACE "([de])" "X\\1Y" replaceOneEscape abc def abcdef)
#one less escape, \1 means first match
string(REGEX REPLACE "([de])" [[X\1Y]] replaceTwoEscape abcdefabcdef)
message(
	"matchOne = ${matchOne}\n"
	"matchAll = ${matchAll}\n"
	"replaceOneEscape = ${replaceOneEscape}\n"
	"replaceTwoEscape = ${replaceTwoEscape}"
)


set(lengthofastring lengthofastring)
string(LENGTH ${lengthofastring} len)
string(TOUPPER ${lengthofastring} upperStr)
message(${len})
message(${upperStr})
set(lengthofastring " ${lengthofastring} ")
message(${lengthofastring})
string(STRIP ${lengthofastring} lengthofastring)
message(${lengthofastring})



set(myList a b c)
# Creates the list "a;b;c"
list(LENGTH myList len)
message("length = ${len}")



set(myList a b c)
#x at idx 2
list(INSERT myList 2 X Y Z)
message("myList (first) = ${myList}")
#at back
list(APPEND myList d e f)
message("myList (second) = ${myList}")
#at front
list(PREPEND myList P Q R)
message("myList (third) = ${myList}")
list(FIND myList d idx)
message("idx = ${idx}")
set(myList a a a a a b c d d d d)
list(REMOVE_ITEM myList a)
message(${myList})
list(REMOVE_DUPLICATES myList)
message(${myList})
#must have least one element
list(REMOVE_AT myList 0)
message(${myList})



set(myList a b c d d d d e e e e e e e f g h i)
list(FIND myList d index)
message("index = ${index}")
list(REMOVE_ITEM myList e)
message("${myList}")
list(REMOVE_AT myList 0)
message("${myList}")
list(REMOVE_DUPLICATES myList)
message("${myList}")
list(POP_FRONT myList pf1 pf2)
message("${myList}")
message("${pf1}, ${pf2}")
list(POP_BACK myList pb1)
message("${myList}")
message("${pb1}")



list(REVERSE myList)
message("${myList}")
list(SORT myList COMPARE STRING CASE SENSITIVE ORDER ASCENDING)
message("${myList}")



set(noBrackets "a_a" "b_b")
set(withBrackets "a[a" "b]b")
list(LENGTH noBrackets lenNo)
list(LENGTH withBrackets lenWith)
list(GET noBrackets 0 firstNo)
list(GET withBrackets 0 firstWith)
#unclosed square bracket bug
message("No brackets: Length=${lenNo} --> First_element=${firstNo}")
message("With brackets: Length=${lenWith} --> First_element=${firstWith}")



#math
set(x 3)
set(y 7)
math(EXPR z "(${x}+${y}) * 2")
message("decimal = ${z}")

math(EXPR zHex "(${x}+${y}) * 2" OUTPUT_FORMAT HEXADECIMAL)
message("hexadecimal = ${zHex}")