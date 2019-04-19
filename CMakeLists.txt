cmake_minimum_required(VERSION 3.6)
include(externalproject)

# Project name
set(NB_CMAKE_PROJECT_NAME "newbie-engine")
project(${NB_CMAKE_PROJECT_NAME})

# Configuration type
set(CMAKE_CONFIGURATION_TYPES NB1_Development NB2_Debug NB3_Release CACHE TYPE INTERNAL FORCE )

set(CMAKE_CXX_FLAGS_NB1_DEVELOPMENT "-Wall")
set(CMAKE_EXE_LINKER_FLAGS_NB1_DEVELOPMENT "-static-libgcc -static-libstdc++")
add_compile_definitions("$<$<CONFIG:NB1_Development>:NB_DEVELOPMENT=1>")

set(CMAKE_CXX_FLAGS_NB2_DEBUG "-Wall")
set(CMAKE_EXE_LINKER_FLAGS_NB2_DEBUG "-static-libgcc -static-libstdc++")
add_compile_definitions("$<$<CONFIG:NB2_Debug>:NB_DEBUG=2>")

set(CMAKE_CXX_FLAGS_NB3_RELEASE "-Wall")
set(CMAKE_EXE_LINKER_FLAGS_NB3_RELEASE "-static-libgcc -static-libstdc++")
add_compile_definitions("$<$<CONFIG:NB3_Release>:NB_RELEASE=3>")
# ~ Configuration type

set(NB_APPLICATION_NAME "project")

add_subdirectory("cmake")
add_subdirectory("modules")
add_subdirectory(${NB_APPLICATION_NAME})

# Set 'core' module as startup project
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT core)