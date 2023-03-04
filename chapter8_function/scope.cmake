function(changeParentVar var1 var2)
    set(${var1} "changedVar1" PARENT_SCOPE)
    set(${var2} "changedVar2" PARENT_SCOPE)
endfunction()

message("before change parent scope ${undef1} ${undef2}")
changeParentVar(undef1 undef2)
message("after change parent scope ${undef1} ${undef2}")

function(returnScopeFunc)
    message("returnScopeFunc enter")
    return()
    message("returnScopeFunc exit")
endfunction()
