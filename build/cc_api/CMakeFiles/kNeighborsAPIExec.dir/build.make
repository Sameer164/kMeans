# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sameeracharya/Desktop/dev/kNN

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sameeracharya/Desktop/dev/kNN/build

# Include any dependencies generated for this target.
include cc_api/CMakeFiles/kNeighborsAPIExec.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include cc_api/CMakeFiles/kNeighborsAPIExec.dir/compiler_depend.make

# Include the progress variables for this target.
include cc_api/CMakeFiles/kNeighborsAPIExec.dir/progress.make

# Include the compile flags for this target's objects.
include cc_api/CMakeFiles/kNeighborsAPIExec.dir/flags.make

cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o: cc_api/CMakeFiles/kNeighborsAPIExec.dir/flags.make
cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o: ../cc_api/main.cpp
cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o: cc_api/CMakeFiles/kNeighborsAPIExec.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sameeracharya/Desktop/dev/kNN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o"
	cd /home/sameeracharya/Desktop/dev/kNN/build/cc_api && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o -MF CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o.d -o CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o -c /home/sameeracharya/Desktop/dev/kNN/cc_api/main.cpp

cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kNeighborsAPIExec.dir/main.cpp.i"
	cd /home/sameeracharya/Desktop/dev/kNN/build/cc_api && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sameeracharya/Desktop/dev/kNN/cc_api/main.cpp > CMakeFiles/kNeighborsAPIExec.dir/main.cpp.i

cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kNeighborsAPIExec.dir/main.cpp.s"
	cd /home/sameeracharya/Desktop/dev/kNN/build/cc_api && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sameeracharya/Desktop/dev/kNN/cc_api/main.cpp -o CMakeFiles/kNeighborsAPIExec.dir/main.cpp.s

# Object files for target kNeighborsAPIExec
kNeighborsAPIExec_OBJECTS = \
"CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o"

# External object files for target kNeighborsAPIExec
kNeighborsAPIExec_EXTERNAL_OBJECTS =

cc_api/kNeighborsAPIExec: cc_api/CMakeFiles/kNeighborsAPIExec.dir/main.cpp.o
cc_api/kNeighborsAPIExec: cc_api/CMakeFiles/kNeighborsAPIExec.dir/build.make
cc_api/kNeighborsAPIExec: cc_api/code/libkMeans.a
cc_api/kNeighborsAPIExec: cc_api/CMakeFiles/kNeighborsAPIExec.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sameeracharya/Desktop/dev/kNN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable kNeighborsAPIExec"
	cd /home/sameeracharya/Desktop/dev/kNN/build/cc_api && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kNeighborsAPIExec.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
cc_api/CMakeFiles/kNeighborsAPIExec.dir/build: cc_api/kNeighborsAPIExec
.PHONY : cc_api/CMakeFiles/kNeighborsAPIExec.dir/build

cc_api/CMakeFiles/kNeighborsAPIExec.dir/clean:
	cd /home/sameeracharya/Desktop/dev/kNN/build/cc_api && $(CMAKE_COMMAND) -P CMakeFiles/kNeighborsAPIExec.dir/cmake_clean.cmake
.PHONY : cc_api/CMakeFiles/kNeighborsAPIExec.dir/clean

cc_api/CMakeFiles/kNeighborsAPIExec.dir/depend:
	cd /home/sameeracharya/Desktop/dev/kNN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sameeracharya/Desktop/dev/kNN /home/sameeracharya/Desktop/dev/kNN/cc_api /home/sameeracharya/Desktop/dev/kNN/build /home/sameeracharya/Desktop/dev/kNN/build/cc_api /home/sameeracharya/Desktop/dev/kNN/build/cc_api/CMakeFiles/kNeighborsAPIExec.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cc_api/CMakeFiles/kNeighborsAPIExec.dir/depend

