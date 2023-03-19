cmake_minimum_required(VERSION 3.5)
project(profile)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Compile with Clang
set(CMAKE_CXX_COMPILER "g++")

# Set compiler flags
set(CMAKE_CXX_FLAGS "-g -static")

# Add the CFIProfiler library target
add_library(profile STATIC CFIProfiler.cpp)
#set target compiler flags
target_compile_options(profile PUBLIC "-fPIC")
# Specify the output name of the library
set_target_properties(profile PROPERTIES OUTPUT_NAME "profile")

# Set the library's include directories (if any)
target_include_directories(profile PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Add the Memory library target
add_library(memprofile STATIC MemoryProfiler.cpp)

# Specify the output name of the library
set_target_properties(memprofile PROPERTIES OUTPUT_NAME "memprofile")

# Set the library's include directories (if any)
target_include_directories(memprofile PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
