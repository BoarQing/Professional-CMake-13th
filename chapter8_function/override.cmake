function(overrideFunc)
    message("origin overrideFunc")
endfunction()


function(overrideFunc)
    _overrideFunc()
    message("overrideFunc overriden")
endfunction()

overrideFunc(TRUE)

function(overrideFunc)
    message("lost origin func access")
endfunction()

function(overrideFunc)
    message("lost origin func access")
endfunction()

overrideFunc()
_overrideFunc()
