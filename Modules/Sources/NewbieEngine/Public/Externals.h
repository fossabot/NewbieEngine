#ifndef NB_NEWBIE_ENGINE_EXTERNAL_H
#define NB_NEWBIE_ENGINE_EXTERNAL_H

#include "CMakeConfigure.gen.h"

// **** imgui ****
#if NB_CONF_MODULE_SHARED
    // MSVC
    #if defined (_MSC_VER) && defined(NewbieEngine_EXPORTS)
        #define IMGUI_API __declspec( dllexport )
    #else
        #define IMGUI_API __declspec( dllimport )
    #endif
#endif

#include "imgui/imgui.h"
// ~~~~ imgui ~~~~

#endif
