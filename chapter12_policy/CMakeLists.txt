cmake_minimum_required(VERSION 3.22.1)
project(policy
		VERSION 1.0.0
		LANGUAGES C CXX)

cmake_policy(PUSH) # note this is automatically done when add_subdirectory
cmake_policy(SET CMP0045 OLD)
get_target_property(outVar doesNotExist COMPILE_DEFINITIONS)
cmake_policy(POP)

cmake_policy(PUSH)
cmake_policy(VERSION 2.8.11)
get_target_property(outVar doesNotExist COMPILE_DEFINITIONS)
cmake_policy(POP)

# will throw error
# get_target_property(outVar doesNotExist COMPILE_DEFINITIONS)