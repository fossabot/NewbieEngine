# External modules

file(GLOB CMAKE_IN_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/*.cmake")
foreach(CMAKE_FILE ${CMAKE_IN_CURRENT_DIR})
    include(${CMAKE_FILE})
endforeach(CMAKE_FILE)
