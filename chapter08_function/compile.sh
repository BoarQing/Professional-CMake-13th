cmake -S . -B build/ \
    -D baseFuncCMake:BOOL=TRUE \
    -D argCMake:BOOL=TRUE \
    -D keywordCMake:BOOL=TRUE \
    -D scopeCMake:BOOL=TRUE \
    -D overrideCMake:BOOL=TRUE \
    -D specialVarCMake:BOOL=TRUE \
    -D invokeCMake:BOOL=TRUE