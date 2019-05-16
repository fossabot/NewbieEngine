# Newbie engine modules
include(ExternalProject)
include(FetchContent)

# Hide 'FetchContent' module related variables from GUI
unset(FETCHCONTENT_BASE_DIR CACHE)
unset(FETCHCONTENT_FULLY_DISCONNECTED CACHE)
unset(FETCHCONTENT_QUIET CACHE)
unset(FETCHCONTENT_UPDATES_DISCONNECTED CACHE)

set(NB_EXTERNAL_DIR "Modules/Externals")

NB_MACRO_GET_SUBDIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR} SUBDIRS)

# External modules must be include earlier
list(REMOVE_ITEM SUBDIRS "Externals")
add_subdirectory("Externals")

FOREACH(SUBDIR ${SUBDIRS})
    add_subdirectory(${SUBDIR})
ENDFOREACH()
