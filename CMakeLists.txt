cmake_minimum_required(VERSION 3.13)

project(llvm-test-house
        VERSION 0.1
	)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ldl -lpthread")
set(CMAKE_C_COMPILER /home/arun/Desktop/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang)

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-Wall -Wextra -fno-unroll-loops -fw2c_sbx)
    add_link_options(-ldl -lstdc++)
endif()
add_executable(simple "${CMAKE_SOURCE_DIR}/simple/simpleTainted.c"
        )
target_link_libraries(simple "${CMAKE_SOURCE_DIR}/static_lib/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/static_lib/libisc_lib_final.a"
        dl)

add_executable(hard "${CMAKE_SOURCE_DIR}/hard/HardTainted.c"
        )
target_link_libraries(hard "${CMAKE_SOURCE_DIR}/static_lib/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/static_lib/libisc_lib_final.a"
        dl)

add_executable(example_2 "${CMAKE_SOURCE_DIR}/example_2/simpleTainted.c"
        )
target_link_libraries(example_2 "${CMAKE_SOURCE_DIR}/static_lib/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/static_lib/libisc_lib_final.a"
        dl)

add_executable(experiment "${CMAKE_SOURCE_DIR}/experiment/simpleTainted.c"
        )

target_link_libraries(experiment "${CMAKE_SOURCE_DIR}/static_lib/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/static_lib/libisc_lib_final.a"
        dl)

add_executable(access "${CMAKE_SOURCE_DIR}/MicroBenchmarking/MemoryAccessTime/access.c")
target_link_libraries(access "${CMAKE_SOURCE_DIR}/MicroBenchmarking/MemoryAccessTime/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/MicroBenchmarking/MemoryAccessTime/libisc_lib_final.a"
        dl)

add_compile_options(-Wall -Wextra -fno-unroll-loops)
add_executable(sbxcall "${CMAKE_SOURCE_DIR}/MicroBenchmarking/SandboxCallToReturnTime/access.c")
target_link_libraries(sbxcall "${CMAKE_SOURCE_DIR}/MicroBenchmarking/SandboxCallToReturnTime/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/MicroBenchmarking/SandboxCallToReturnTime/libisc_lib_final.a"
        dl)

add_executable(tptr "${CMAKE_SOURCE_DIR}/MicroBenchmarking/AccessingTaintedDataInCheckedRegion/access.c")
target_link_libraries(tptr "${CMAKE_SOURCE_DIR}/MicroBenchmarking/AccessingTaintedDataInCheckedRegion/libSBX_CON_LIB.a"
        "${CMAKE_SOURCE_DIR}/MicroBenchmarking/AccessingTaintedDataInCheckedRegion/libisc_lib_final.a"
        dl)
