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
include CMakeFiles/kMeansPyExport.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/kMeansPyExport.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/kMeansPyExport.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kMeansPyExport.dir/flags.make

CMakeFiles/kMeansPyExport.dir/main.cpp.o: CMakeFiles/kMeansPyExport.dir/flags.make
CMakeFiles/kMeansPyExport.dir/main.cpp.o: ../main.cpp
CMakeFiles/kMeansPyExport.dir/main.cpp.o: CMakeFiles/kMeansPyExport.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sameeracharya/Desktop/dev/kNN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/kMeansPyExport.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/kMeansPyExport.dir/main.cpp.o -MF CMakeFiles/kMeansPyExport.dir/main.cpp.o.d -o CMakeFiles/kMeansPyExport.dir/main.cpp.o -c /home/sameeracharya/Desktop/dev/kNN/main.cpp

CMakeFiles/kMeansPyExport.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kMeansPyExport.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sameeracharya/Desktop/dev/kNN/main.cpp > CMakeFiles/kMeansPyExport.dir/main.cpp.i

CMakeFiles/kMeansPyExport.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kMeansPyExport.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sameeracharya/Desktop/dev/kNN/main.cpp -o CMakeFiles/kMeansPyExport.dir/main.cpp.s

# Object files for target kMeansPyExport
kMeansPyExport_OBJECTS = \
"CMakeFiles/kMeansPyExport.dir/main.cpp.o"

# External object files for target kMeansPyExport
kMeansPyExport_EXTERNAL_OBJECTS =

kMeansPyExport.cpython-310-x86_64-linux-gnu.so: CMakeFiles/kMeansPyExport.dir/main.cpp.o
kMeansPyExport.cpython-310-x86_64-linux-gnu.so: CMakeFiles/kMeansPyExport.dir/build.make
kMeansPyExport.cpython-310-x86_64-linux-gnu.so: cc_api/code/libkMeans.a
kMeansPyExport.cpython-310-x86_64-linux-gnu.so: CMakeFiles/kMeansPyExport.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sameeracharya/Desktop/dev/kNN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module kMeansPyExport.cpython-310-x86_64-linux-gnu.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kMeansPyExport.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/strip /home/sameeracharya/Desktop/dev/kNN/build/kMeansPyExport.cpython-310-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
CMakeFiles/kMeansPyExport.dir/build: kMeansPyExport.cpython-310-x86_64-linux-gnu.so
.PHONY : CMakeFiles/kMeansPyExport.dir/build

CMakeFiles/kMeansPyExport.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kMeansPyExport.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kMeansPyExport.dir/clean

CMakeFiles/kMeansPyExport.dir/depend:
	cd /home/sameeracharya/Desktop/dev/kNN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sameeracharya/Desktop/dev/kNN /home/sameeracharya/Desktop/dev/kNN /home/sameeracharya/Desktop/dev/kNN/build /home/sameeracharya/Desktop/dev/kNN/build /home/sameeracharya/Desktop/dev/kNN/build/CMakeFiles/kMeansPyExport.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/kMeansPyExport.dir/depend
