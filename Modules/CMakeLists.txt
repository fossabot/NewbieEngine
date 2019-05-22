# Newbie engine modules
include(ExternalProject)
include(FetchContent)

# Hide 'FetchContent' module related variables from GUI
unset(FETCHCONTENT_BASE_DIR CACHE)
unset(FETCHCONTENT_FULLY_DISCONNECTED CACHE)
unset(FETCHCONTENT_QUIET CACHE)
unset(FETCHCONTENT_UPDATES_DISCONNECTED CACHE)

set(NB_MODULE_EXTERNAL_DIR "Modules/Externals")
set(NB_MODULE_SOURCE_DIR "Modules/Sources")
set(NB_MODULE_OUTPUT_DIR "Modules/Outputs")

add_subdirectory("Externals")
add_subdirectory("Sources")
