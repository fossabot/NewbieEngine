# Newbie engine core module.
# Core module has program entry point.

set(NB_CURRENT_MODULE_NAME "Core")

# Header / Source container
set(NB_CURRENT_BUILD_HEADERS)
set(NB_CURRENT_BUILD_SOURCES)

# Appending Header / Source in current directory
add_subdirectory("Runtime")
add_subdirectory("Editor")

file(GLOB NB_HEADERS_IN_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/*.h")
set(NB_CURRENT_BUILD_HEADERS ${NB_HEADERS_IN_CURRENT_DIR} ${NB_CURRENT_BUILD_HEADERS})

file(GLOB NB_SOURCES_IN_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/*.hpp" "${CMAKE_CURRENT_LIST_DIR}/*.cpp")
set(NB_CURRENT_BUILD_SOURCES ${NB_SOURCES_IN_CURRENT_DIR} ${NB_CURRENT_BUILD_SOURCES})

set(NB_CURRENT_BUILD_HEADERS_SOURCES ${NB_CURRENT_BUILD_HEADERS} ${NB_CURRENT_BUILD_SOURCES})

# Source grouping for IDE
NB_FUNC_GROUP_SOURCE("${NB_CURRENT_BUILD_HEADERS_SOURCES}" "${CMAKE_CURRENT_LIST_DIR}")

# Header/Source of Drop-Down libraries

# imgui
NB_FUNC_EXTERNAL_MODULE_IMGUI(NB_EXTERNAL_INCLUDE_IMGUI NB_EXTERNAL_HEADERS_IMGUI NB_EXTERNAL_SOURCES_IMGUI)

# Make module
add_executable(${NB_CURRENT_MODULE_NAME} 
    ${NB_CURRENT_BUILD_HEADERS} ${NB_CURRENT_BUILD_SOURCES}
    ${NB_EXTERNAL_HEADERS_IMGUI} ${NB_EXTERNAL_SOURCES_IMGUI})  # imgui

set_target_properties(${NB_CURRENT_MODULE_NAME} PROPERTIES LINKER_LANGUAGE CXX)

# Additional properties
set_target_properties(${NB_CURRENT_MODULE_NAME} PROPERTIES FOLDER Modules)

if(MSVC)
    set_property(DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${NB_CURRENT_MODULE_NAME})
endif()

# GLFW
include_directories("${CMAKE_SOURCE_DIR}/Modules/Externals/glfw/include")
target_link_libraries(${NB_CURRENT_MODULE_NAME} "${CMAKE_SOURCE_DIR}/Modules/Externals/glfw/lib/glfw3.lib")
add_dependencies(${NB_CURRENT_MODULE_NAME} glfw)

# imgui
include_directories(${NB_EXTERNAL_INCLUDE_IMGUI})
