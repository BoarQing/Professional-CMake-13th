add_executable(main
    a.cpp
    b.cpp
    c.cpp
    main.cpp)

set_target_properties(main PROPERTIES
    UNITY_BUILD_BATCH_SIZE 3
)