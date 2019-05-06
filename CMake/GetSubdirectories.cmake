# Get all subdirectories in specific directory
# curdir[in]        Specific directory to get subdirectories
# result[out]       Return parameter
macro(NB_MACRO_GET_SUBDIRECTORIES curDir result)
file(GLOB children RELATIVE ${curDir} ${curDir}/*)

set(dirList)
foreach(child ${children})
  if(IS_DIRECTORY ${curDir}/${child})
      set(dirList ${dirList} ${child})
  endif()
endforeach()

set(${result} ${dirList})
endmacro()