cmake_minimum_required(VERSION 3.0)

project(MyProject)

set(CMAKE_C_COMPILER /home/arun/Desktop/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang)
set(CMAKE_CXX_COMPILER /home/arun/Desktop/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang)

add_executable(access_wasm access.c)
target_compile_options(access_wasm PRIVATE -fwasmsbx -g -Dwasmsbx)
target_link_options(access_wasm PRIVATE -ldl -lstdc++)
target_link_libraries(access_wasm ${CMAKE_SOURCE_DIR}/../WASM_LIB/libSBX_CON_LIB.a ${CMAKE_SOURCE_DIR}/../WASM_LIB/libisc_lib_final.a )


add_executable(access_hoard_cfi access.c access.h ../HOARD_LIB/Hoard/src/include/hoard/hoardmanager.h)
target_compile_options(access_hoard_cfi PRIVATE -fheapsbx -g -Dhoardsbx)
target_link_options(access_hoard_cfi PRIVATE -ldl -lstdc++)
target_link_libraries(access_hoard_cfi
        ${CMAKE_SOURCE_DIR}/../HOARD_LIB/libhoard.so
        ${CMAKE_SOURCE_DIR}/../HOARD_LIB/libprofile.a
       )

add_executable(bug bug.c bug.h)
target_compile_options(bug PRIVATE -fwasmsbx -g -DWASM_SBX)
target_link_options(bug PRIVATE -ldl -lstdc++)
target_link_libraries(bug
        ${CMAKE_SOURCE_DIR}/WASM_SBX/libSBX_CON_LIB.a
        ${CMAKE_SOURCE_DIR}/WASM_SBX_CODE/libisc_lib_final.a
        )
