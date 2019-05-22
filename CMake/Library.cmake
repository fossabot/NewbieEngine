# Library related utility

# Get static library extension included file name by file name without extension
# libName[in]       Static library name without extension
# libFileName[out]  Static library file name with extension
function(NB_STATIC_LIBRARY_FILE_NAME libName libFileName)
    set(ret ${libName})

    if(MSVC)
        set(ret "${libName}.lib")
    else()
        set(ret "${libName}.a")
    endif()

    set(${libFileName} ${ret} PARENT_SCOPE)
endfunction()

# Get shared library extension included file name by file name without extension
# libName[in]       Shared library name without extension
# libFileName[out]  Shared library file name with extension
function(NB_SHARED_LIBRARY_FILE_NAME libName libFileName)
    set(ret ${libName})

    if(MSVC)
        set(ret "${libName}.dll")
    else()
        set(ret "${libName}.so")
    endif()

    set(${libFileName} ${ret} PARENT_SCOPE)
endfunction()