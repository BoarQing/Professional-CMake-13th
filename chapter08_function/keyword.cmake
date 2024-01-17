function(keywordFunc arg)
    set(prefix PRE)
    set(noValues ENABLE_HARDWORKING ENABLE_NONSLEEP)
    set(singleValues WORKTIME LEVEL)
    set(multiValues CLASSES)
    cmake_parse_arguments(
        PARSE_ARGV 0 #start parse at the first argument
        ${prefix}
        "${noValues}" "${singleValues}" "${multiValues}"
    )
    message("arg = ${arg}")
    message("nonValues = ${${prefix}_ENABLE_HARDWORKING} ${${prefix}_ENABLE_NONSLEEP}")
    message("singleValues = ${${prefix}_WORKTIME} ${${prefix}_LEVEL}")
    message("multiValues = ${${prefix}_CLASSES}")

    message("Left-over args: ${${prefix}_UNPARSED_ARGUMENTS}")
endfunction()

keywordFunc(ENABLE_HARDWORKING UNUSED
             WORKTIME 8
             UNUSED2
             CLASSES OS "machine learning"
             LEVEL hard)

function(twoLevelKeywordFunc)
    set(rootOption GRP1 GRP2)
                        #prefix no single multi from
    cmake_parse_arguments(root "" "" "${rootOption}" ${ARGN})

    set(leafOption CHILD1 CHILD2)
    cmake_parse_arguments(C1 "" ${leafOption} "" "${root_GRP1}")
    cmake_parse_arguments(C2 "" ${leafOption} "" "${root_GRP2}")

    message("Parse subcommand ${root_GRP1}")
    message("CHILD1 FROM GRP1 = ${C1_CHILD1}")
    message("CHILD2 FROM GRP1 = ${C1_CHILD2}")
    message("Parse subcommand ${root_GRP2}")
    message("CHILD1 FROM GRP2 = ${C2_CHILD1}")
    message("CHILD2 FROM GRP2 = ${C2_CHILD2}")
endfunction()

twoLevelKeywordFunc(
    GRP1
        CHILD1 Alienware
        CHILD2 ROG
    GRP2
        CHILD1 Lenovo
        CHILD2 HP
)


