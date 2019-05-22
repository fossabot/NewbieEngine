# GLFW
# Official website : https://www.glfw.org/
# Git repository : https://github.com/glfw/glfw

# GLFW can build static or shared version
# Static version
#   - ./include/GLFW
#   - ./lib/glfw3.[lib or a]
# Shared version
#   - ./include/GLFW
#   - ./lib/glfw3dll.[lib or a]
#   - ./bin/glfw3.[dll or so]

ExternalProject_Add( glfw PREFIX glfw
    GIT_REPOSITORY https://github.com/glfw/glfw.git
    GIT_TAG 3.3

    INSTALL_DIR "${CMAKE_SOURCE_DIR}/${NB_MODULE_EXTERNAL_DIR}/glfw"
    
    # Skip build command.
    BUILD_COMMAND ""    

    CMAKE_ARGS
        "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
        "-DCMAKE_BUILD_TYPE=Release"
        "-DCMAKE_CONFIGURATION_TYPES=Release"
        "-DGLFW_BUILD_EXAMPLES=OFF"
        "-DGLFW_BUILD_TESTS=OFF"
        "-DGLFW_BUILD_DOCS=OFF"
        "-DBUILD_SHARED_LIBS=ON"

    INSTALL_COMMAND
        ${CMAKE_COMMAND}
        --build .
        --target install
        --config Release
    
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

set_target_properties(glfw PROPERTIES FOLDER ${NB_MODULE_EXTERNAL_DIR})
