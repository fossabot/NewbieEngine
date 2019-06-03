#ifndef NB_NEWBIE_ENGINE_PUBLIC_CLASS_H
#define NB_NEWBIE_ENGINE_PUBLIC_CLASS_H

#include "CMakeConfigure.gen.h"

#if NB_CONF_MODULE_SHARED
	#if defined (_MSC_VER) && defined(NewbieEngine_EXPORTS)
		#define IMGUI_API __declspec( dllexport )
	#else
		#define IMGUI_API __declspec( dllimport )
	#endif
#endif

#include "imgui/imgui.h"

#endif
