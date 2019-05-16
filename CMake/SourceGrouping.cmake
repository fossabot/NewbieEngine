# Source grouping for organization in IDE

# Fix path for source grouping
# pathToFix[in]         Path string to fix
# fixedPath[out]        Fixed path
function(NB_FUNC_FIX_PATH_FOR_GROUP_SOURCE pathToFix fixedPath)
    set(ret ${pathToFix})

    if(MSVC)
        string(REPLACE "/" "\\" ret ${pathToFix})
    endif()

    set(${fixedPath} ${ret} PARENT_SCOPE)
endfunction()

# Group source
# sourcesToGroup[in]    Path string to group
# groupRoot[in]         Group root path string
function(NB_FUNC_GROUP_SOURCE sourcesToGroup groupRoot)
    foreach(source ${sourcesToGroup})
        file(RELATIVE_PATH relative ${groupRoot} ${source})
        get_filename_component(parentDir ${relative} DIRECTORY)

        if(NOT ${parentDir} STREQUAL "")
            NB_FUNC_FIX_PATH_FOR_GROUP_SOURCE(${parentDir} fixedParentdir)
            source_group(${fixedParentdir} FILES ${source})
        else()
            source_group("" FILES ${source})
        endif()
    endforeach()
endfunction()

# Group source
# sourcesToGroup[in]    Path string to group
# groupRoot[in]         Group root path string
# groupTail[in]            Additional tail group
function(NB_FUNC_GROUP_SOURCE_WITH_TAIL sourcesToGroup groupRoot groupTail)
    foreach(source ${sourcesToGroup})
        file(RELATIVE_PATH relative ${groupRoot} ${source})
        get_filename_component(parentDir ${relative} DIRECTORY)

        if(NOT ${parentDir} STREQUAL "")
            NB_FUNC_FIX_PATH_FOR_GROUP_SOURCE("${groupTail}/${parentDir}" fixedParentdir)
            source_group(${fixedParentdir} FILES ${source})
        else()
            source_group("${groupTail}" FILES ${source})
        endif()
    endforeach()
endfunction()
