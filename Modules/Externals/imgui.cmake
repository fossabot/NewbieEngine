# imgui
# Git repository : "https://github.com/ocornut/imgui
# Drop-Down library

FetchContent_GetProperties(imgui)
if(NOT imgui_POPULATED)
    message(STATUS "Clone 'imgui' from [https://github.com/ocornut/imgui.git]")
    FetchContent_Populate(imgui
        QUIET
        SUBBUILD_DIR "${FETCHCONTENT_BASE_DIR}/imgui/subbuild"
        SOURCE_DIR "${FETCHCONTENT_BASE_DIR}/imgui/src"
        BINARY_DIR "${FETCHCONTENT_BASE_DIR}/imgui/build"
        GIT_REPOSITORY "https://github.com/ocornut/imgui.git"
        GIT_TAG "4158cba1ffd338c46d52164c2be0762031e66f53"
    )
    message(STATUS "Clone 'imgui' Done")

    if(EXISTS "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui")
        file(REMOVE "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui")
    endif()

    file(GLOB NB_FETCH_CONTENT_HEADERS "${FETCHCONTENT_BASE_DIR}/imgui/src/*.h")
    file(GLOB NB_FETCH_CONTENT_SOURCES "${FETCHCONTENT_BASE_DIR}/imgui/src/*.cpp")
    file(COPY ${NB_FETCH_CONTENT_HEADERS} ${NB_FETCH_CONTENT_SOURCES} DESTINATION "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui/Sources/imgui")
endif()

# Get list of header and source of imgui
# headers[out]      List of imgui header file
# sources[out]      List of imgui source file
function(NB_FUNC_EXTERNAL_MODULE_IMGUI include headers sources)
    file(GLOB NB_EXTERNAL_MODULE_HEADERS "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui/Sources/imgui/*.h")
    file(GLOB NB_EXTERNAL_MODULE_SOURCES "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui/Sources/imgui/*.cpp")

    NB_FUNC_GROUP_SOURCE_WITH_TAIL("${NB_EXTERNAL_MODULE_HEADERS}" "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui/Sources" "Externals")
    NB_FUNC_GROUP_SOURCE_WITH_TAIL("${NB_EXTERNAL_MODULE_SOURCES}" "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui/Sources" "Externals")

    set(${include} "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/imgui/Sources" PARENT_SCOPE)
    set(${headers} ${NB_EXTERNAL_MODULE_HEADERS} PARENT_SCOPE)
    set(${sources} ${NB_EXTERNAL_MODULE_SOURCES} PARENT_SCOPE)
endfunction()
