# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/209/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/209/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arun/Desktop/CheckCBox-LLVM-TestHouse

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/experiment.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/experiment.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/experiment.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/experiment.dir/flags.make

CMakeFiles/experiment.dir/experiment/simpleTainted.c.o: CMakeFiles/experiment.dir/flags.make
CMakeFiles/experiment.dir/experiment/simpleTainted.c.o: ../experiment/simpleTainted.c
CMakeFiles/experiment.dir/experiment/simpleTainted.c.o: CMakeFiles/experiment.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/experiment.dir/experiment/simpleTainted.c.o"
	/home/arun/Desktop/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/experiment.dir/experiment/simpleTainted.c.o -MF CMakeFiles/experiment.dir/experiment/simpleTainted.c.o.d -o CMakeFiles/experiment.dir/experiment/simpleTainted.c.o -c /home/arun/Desktop/CheckCBox-LLVM-TestHouse/experiment/simpleTainted.c

CMakeFiles/experiment.dir/experiment/simpleTainted.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/experiment.dir/experiment/simpleTainted.c.i"
	/home/arun/Desktop/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/arun/Desktop/CheckCBox-LLVM-TestHouse/experiment/simpleTainted.c > CMakeFiles/experiment.dir/experiment/simpleTainted.c.i

CMakeFiles/experiment.dir/experiment/simpleTainted.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/experiment.dir/experiment/simpleTainted.c.s"
	/home/arun/Desktop/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/arun/Desktop/CheckCBox-LLVM-TestHouse/experiment/simpleTainted.c -o CMakeFiles/experiment.dir/experiment/simpleTainted.c.s

# Object files for target experiment
experiment_OBJECTS = \
"CMakeFiles/experiment.dir/experiment/simpleTainted.c.o"

# External object files for target experiment
experiment_EXTERNAL_OBJECTS =

experiment: CMakeFiles/experiment.dir/experiment/simpleTainted.c.o
experiment: CMakeFiles/experiment.dir/build.make
experiment: ../static_lib/libSBX_CON_LIB.a
experiment: ../static_lib/libisc_lib_final.a
experiment: CMakeFiles/experiment.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable experiment"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/experiment.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/experiment.dir/build: experiment
.PHONY : CMakeFiles/experiment.dir/build

CMakeFiles/experiment.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/experiment.dir/cmake_clean.cmake
.PHONY : CMakeFiles/experiment.dir/clean

CMakeFiles/experiment.dir/depend:
	cd /home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arun/Desktop/CheckCBox-LLVM-TestHouse /home/arun/Desktop/CheckCBox-LLVM-TestHouse /home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug /home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug /home/arun/Desktop/CheckCBox-LLVM-TestHouse/cmake-build-debug/CMakeFiles/experiment.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/experiment.dir/depend

