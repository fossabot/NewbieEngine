# Module 'NewbieEngine'
# NewbieEngine is core module of engine

# It is static library
# - 'NewbieEngine.lib'

set(NB_CURRENT_MODULE_NAME "NewbieEngine")

# Library build as static/shared
set(NB_MODULE_BUILD_SHARED FALSE)

# **** Configuration ****

set(NB_CONF_MODULE_NAME ${NB_CURRENT_MODULE_NAME})

if(NOT ${NB_MODULE_BUILD_SHARED})
    set(NB_CONF_MODULE_STATIC 1)
    set(NB_CONF_MODULE_SHARED 0) 
else()
    set(NB_CONF_MODULE_STATIC 0)
    set(NB_CONF_MODULE_SHARED 1)
endif()

set(NB_TEMPLATE_CMAKE_CONFIGURE_FILE "${CMAKE_CURRENT_LIST_DIR}/Public/CMakeConfigure.tpl.h")
set(NB_GENERATED_CMAKE_CONFIGURE_FILE "${CMAKE_CURRENT_LIST_DIR}/Public/CMakeConfigure.gen.h")
configure_file(${NB_TEMPLATE_CMAKE_CONFIGURE_FILE} ${NB_GENERATED_CMAKE_CONFIGURE_FILE})

# ~~~~ Configuration ~~~~

# Initialize source cache
set(NB_MODULE_CUR_PUBLIC_HEADERS)
set(NB_MODULE_CUR_PUBLIC_SOURCES)
set(NB_MODULE_CUR_PRIVATE_HEADERS)
set(NB_MODULE_CUR_PRIVATE_SOURCES)

# Appending cache from public/private sources 
add_subdirectory("Public")
add_subdirectory("Private")

# Source grouping for IDE
NB_FUNC_GROUP_SOURCE("${NB_MODULE_CUR_PUBLIC_HEADERS}" "${CMAKE_CURRENT_LIST_DIR}")
NB_FUNC_GROUP_SOURCE("${NB_MODULE_CUR_PUBLIC_SOURCES}" "${CMAKE_CURRENT_LIST_DIR}")
NB_FUNC_GROUP_SOURCE("${NB_MODULE_CUR_PRIVATE_HEADERS}" "${CMAKE_CURRENT_LIST_DIR}")
NB_FUNC_GROUP_SOURCE("${NB_MODULE_CUR_PRIVATE_SOURCES}" "${CMAKE_CURRENT_LIST_DIR}")

# **** Get External Drop-Down Module Infomations ****

# imgui
NB_FUNC_EXTERNAL_MODULE_IMGUI(
    NB_EXTERNAL_INCLUDE_IMGUI   # imgui include path
    NB_EXTERNAL_HEADERS_IMGUI   # imgui header file list
    NB_EXTERNAL_SOURCES_IMGUI   # imgui source file list
)

# ~~~~ Get External Drop-Down Module Infomations ~~~~

if(NOT ${NB_MODULE_BUILD_SHARED})
    # Build as static library
    message(STATUS "Module: (Static) ${NB_CURRENT_MODULE_NAME}")
    add_library(${NB_CURRENT_MODULE_NAME} STATIC
        ${NB_MODULE_CUR_PUBLIC_HEADERS} ${NB_MODULE_CUR_PUBLIC_SOURCES}
        ${NB_MODULE_CUR_PRIVATE_HEADERS} ${NB_MODULE_CUR_PRIVATE_SOURCES}
        ${NB_EXTERNAL_HEADERS_IMGUI} ${NB_EXTERNAL_SOURCES_IMGUI} # imgui
    ) 
else()
    # Build as shared library
    message(STATUS "Module: (Shared) ${NB_CURRENT_MODULE_NAME}")
    add_library(${NB_CURRENT_MODULE_NAME} SHARED
        ${NB_MODULE_CUR_PUBLIC_HEADERS} ${NB_MODULE_CUR_PUBLIC_SOURCES}
        ${NB_MODULE_CUR_PRIVATE_HEADERS} ${NB_MODULE_CUR_PRIVATE_SOURCES}
        ${NB_EXTERNAL_HEADERS_IMGUI} ${NB_EXTERNAL_SOURCES_IMGUI} # imgui
        )
endif()

include_directories("${CMAKE_CURRENT_LIST_DIR}/Public")
include_directories("${CMAKE_CURRENT_LIST_DIR}/Private")

set_target_properties( ${NB_CURRENT_MODULE_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Modules/Outputs/$<CONFIG>"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Modules/Outputs/$<CONFIG>"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Modules/Outputs/$<CONFIG>"
    LINKER_LANGUAGE CXX
    FOLDER Modules
)

# **** Include External Drop-Down Modules ****

include_directories(${NB_EXTERNAL_INCLUDE_IMGUI})   # imgui

# ~~~~ Include External Drop-Down Modules ~~~~


set(NB_MODULE_NEWBIE_ENGINE_SHARED_LIBRARY_REQUIREMENT)

# **** Add dependency of GLFW ****

add_dependencies(${NB_CURRENT_MODULE_NAME} glfw)

# GLFW
include_directories("${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/glfw/include")
target_link_libraries(${NB_CURRENT_MODULE_NAME} "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/glfw/lib/glfw3dll.lib")
set(NB_MODULE_NEWBIE_ENGINE_SHARED_LIBRARY_REQUIREMENT "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/glfw/bin/glfw3.dll" ${NB_MODULE_NEWBIE_ENGINE_SHARED_LIBRARY_REQUIREMENT} PARENT_SCOPE)

# ~~~~ Add dependency of GLFW ~~~~
