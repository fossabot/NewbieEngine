# imgui
# Git repository : "https://github.com/ocornut/imgui

ExternalProject_Add( imgui PREFIX imgui
    GIT_REPOSITORY "https://github.com/ocornut/imgui.git"
    GIT_TAG "655ebe4eaff15a3996233f81885e1a3e218caab0"

    INSTALL_DIR "${CMAKE_SOURCE_DIR}/Modules/Externals/imgui"
    
    # Skip build command.
    BUILD_COMMAND ""

    # Skip configure command.
    CONFIGURE_COMMAND ""

    INSTALL_COMMAND
        COMMAND ${CMAKE_COMMAND} -E echo "INSTALL_COMMAND (imgui)"
        COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_SOURCE_DIR}/${NB_EXTERNAL_DIR}/imgui"
        COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/${NB_EXTERNAL_DIR}/imgui/src/imgui" "${CMAKE_SOURCE_DIR}/${NB_EXTERNAL_DIR}/imgui/include/imgui"

    CMAKE_ARGS
        "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"

    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

set_target_properties(imgui PROPERTIES FOLDER Modules/Externals)
