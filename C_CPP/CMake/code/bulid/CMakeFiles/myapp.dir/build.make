# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nio/workspace/Notes/C_CPP/CMake/code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nio/workspace/Notes/C_CPP/CMake/code/bulid

# Include any dependencies generated for this target.
include CMakeFiles/myapp.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/myapp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/myapp.dir/flags.make

CMakeFiles/myapp.dir/add.c.o: CMakeFiles/myapp.dir/flags.make
CMakeFiles/myapp.dir/add.c.o: ../add.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/myapp.dir/add.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/myapp.dir/add.c.o   -c /home/nio/workspace/Notes/C_CPP/CMake/code/add.c

CMakeFiles/myapp.dir/add.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myapp.dir/add.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nio/workspace/Notes/C_CPP/CMake/code/add.c > CMakeFiles/myapp.dir/add.c.i

CMakeFiles/myapp.dir/add.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myapp.dir/add.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nio/workspace/Notes/C_CPP/CMake/code/add.c -o CMakeFiles/myapp.dir/add.c.s

CMakeFiles/myapp.dir/div.c.o: CMakeFiles/myapp.dir/flags.make
CMakeFiles/myapp.dir/div.c.o: ../div.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/myapp.dir/div.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/myapp.dir/div.c.o   -c /home/nio/workspace/Notes/C_CPP/CMake/code/div.c

CMakeFiles/myapp.dir/div.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myapp.dir/div.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nio/workspace/Notes/C_CPP/CMake/code/div.c > CMakeFiles/myapp.dir/div.c.i

CMakeFiles/myapp.dir/div.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myapp.dir/div.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nio/workspace/Notes/C_CPP/CMake/code/div.c -o CMakeFiles/myapp.dir/div.c.s

CMakeFiles/myapp.dir/main.c.o: CMakeFiles/myapp.dir/flags.make
CMakeFiles/myapp.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/myapp.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/myapp.dir/main.c.o   -c /home/nio/workspace/Notes/C_CPP/CMake/code/main.c

CMakeFiles/myapp.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myapp.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nio/workspace/Notes/C_CPP/CMake/code/main.c > CMakeFiles/myapp.dir/main.c.i

CMakeFiles/myapp.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myapp.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nio/workspace/Notes/C_CPP/CMake/code/main.c -o CMakeFiles/myapp.dir/main.c.s

CMakeFiles/myapp.dir/mult.c.o: CMakeFiles/myapp.dir/flags.make
CMakeFiles/myapp.dir/mult.c.o: ../mult.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/myapp.dir/mult.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/myapp.dir/mult.c.o   -c /home/nio/workspace/Notes/C_CPP/CMake/code/mult.c

CMakeFiles/myapp.dir/mult.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myapp.dir/mult.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nio/workspace/Notes/C_CPP/CMake/code/mult.c > CMakeFiles/myapp.dir/mult.c.i

CMakeFiles/myapp.dir/mult.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myapp.dir/mult.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nio/workspace/Notes/C_CPP/CMake/code/mult.c -o CMakeFiles/myapp.dir/mult.c.s

CMakeFiles/myapp.dir/sub.c.o: CMakeFiles/myapp.dir/flags.make
CMakeFiles/myapp.dir/sub.c.o: ../sub.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/myapp.dir/sub.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/myapp.dir/sub.c.o   -c /home/nio/workspace/Notes/C_CPP/CMake/code/sub.c

CMakeFiles/myapp.dir/sub.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myapp.dir/sub.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nio/workspace/Notes/C_CPP/CMake/code/sub.c > CMakeFiles/myapp.dir/sub.c.i

CMakeFiles/myapp.dir/sub.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myapp.dir/sub.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nio/workspace/Notes/C_CPP/CMake/code/sub.c -o CMakeFiles/myapp.dir/sub.c.s

# Object files for target myapp
myapp_OBJECTS = \
"CMakeFiles/myapp.dir/add.c.o" \
"CMakeFiles/myapp.dir/div.c.o" \
"CMakeFiles/myapp.dir/main.c.o" \
"CMakeFiles/myapp.dir/mult.c.o" \
"CMakeFiles/myapp.dir/sub.c.o"

# External object files for target myapp
myapp_EXTERNAL_OBJECTS =

myapp: CMakeFiles/myapp.dir/add.c.o
myapp: CMakeFiles/myapp.dir/div.c.o
myapp: CMakeFiles/myapp.dir/main.c.o
myapp: CMakeFiles/myapp.dir/mult.c.o
myapp: CMakeFiles/myapp.dir/sub.c.o
myapp: CMakeFiles/myapp.dir/build.make
myapp: CMakeFiles/myapp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable myapp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/myapp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/myapp.dir/build: myapp

.PHONY : CMakeFiles/myapp.dir/build

CMakeFiles/myapp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/myapp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/myapp.dir/clean

CMakeFiles/myapp.dir/depend:
	cd /home/nio/workspace/Notes/C_CPP/CMake/code/bulid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nio/workspace/Notes/C_CPP/CMake/code /home/nio/workspace/Notes/C_CPP/CMake/code /home/nio/workspace/Notes/C_CPP/CMake/code/bulid /home/nio/workspace/Notes/C_CPP/CMake/code/bulid /home/nio/workspace/Notes/C_CPP/CMake/code/bulid/CMakeFiles/myapp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/myapp.dir/depend

