cmake_minimum_required(VERSION 3.6)
include(externalproject)

# Project name
set(NB_CMAKE_PROJECT_NAME "newbie-engine")
project(${NB_CMAKE_PROJECT_NAME})

# Configuration type
set(CMAKE_CONFIGURATION_TYPES NB1_Development NB2_Debug NB3_Release CACHE TYPE INTERNAL FORCE )

set(CMAKE_CXX_FLAGS_NB1_DEVELOPMENT ${CMAKE_CXX_FLAGS_DEBUG})
set(CMAKE_EXE_LINKER_FLAGS_NB1_DEVELOPMENT ${CMAKE_EXE_LINKER_FLAGS_DEBUG})
add_compile_definitions("$<$<CONFIG:NB1_Development>:NB_DEVELOPMENT=1>")

set(CMAKE_CXX_FLAGS_NB2_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})
set(CMAKE_EXE_LINKER_FLAGS_NB2_DEBUG ${CMAKE_EXE_LINKER_FLAGS_DEBUG})
add_compile_definitions("$<$<CONFIG:NB2_Debug>:NB_DEBUG=2>")

set(CMAKE_CXX_FLAGS_NB3_RELEASE ${CMAKE_CXX_FLAGS_RELEASE})
set(CMAKE_EXE_LINKER_FLAGS_NB3_RELEASE ${CMAKE_EXE_LINKER_FLAGS_RELEASE})
add_compile_definitions("$<$<CONFIG:NB3_Release>:NB_RELEASE=3>")
# ~ Configuration type

set(NB_APPLICATION_NAME "project")

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
add_subdirectory("CMake")
add_subdirectory("Modules")
add_subdirectory(${NB_APPLICATION_NAME})
