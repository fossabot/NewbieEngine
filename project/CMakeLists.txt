# Newbie engine project module.
# Project module is non-compiled module. But has custom command.

set(NB_CURRENT_MODULE_NAME "project")

# Header / Source container
set(NB_CURRENT_BUILD_HEADERS)
set(NB_CURRENT_BUILD_SOURCES)

# Appending Header / Source in current directory
add_subdirectory("runtime")
add_subdirectory("editor")

file(GLOB NB_HEADERS_IN_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/*.h")
set(NB_CURRENT_BUILD_HEADERS ${NB_HEADERS_IN_CURRENT_DIR} ${NB_CURRENT_BUILD_HEADERS})

file(GLOB NB_SOURCES_IN_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/*.hpp" "${CMAKE_CURRENT_LIST_DIR}/*.cpp")
set(NB_CURRENT_BUILD_SOURCES ${NB_SOURCES_IN_CURRENT_DIR} ${NB_CURRENT_BUILD_SOURCES})

set(NB_CURRENT_BUILD_HEADERS_SOURCES ${NB_CURRENT_BUILD_HEADERS} ${NB_CURRENT_BUILD_SOURCES})

FOREACH(source ${NB_CURRENT_BUILD_HEADERS_SOURCES})
    message(STATUS ${source})
ENDFOREACH()

# Source grouping for IDE
NB_FUNC_GROUP_SOURCE("${NB_CURRENT_BUILD_HEADERS_SOURCES}" "${CMAKE_CURRENT_LIST_DIR}")

# Add custom target project
add_custom_target(${NB_CURRENT_MODULE_NAME} SOURCES ${NB_CURRENT_BUILD_HEADERS} ${NB_CURRENT_BUILD_SOURCES})
add_custom_command(TARGET ${NB_CURRENT_MODULE_NAME} PRE_BUILD
    COMMAND echo "TEMP ECHO!!!!!"
)

# Add dependency to core
# ** Core moduls has dependenct on project  ** 
# ** Without dependency, custom command of project module never called **
add_dependencies(core ${NB_CURRENT_MODULE_NAME})
