#ifndef NB_NEWBIE_ENGINE_SETTINGS_H
#define NB_NEWBIE_ENGINE_SETTINGS_H

#include "CMakeConfigure.gen.h"

#if NB_CONF_MODULE_SHARED
	#if defined (_MSC_VER) && defined(NewbieEngine_EXPORTS)
		#define NB_API_NEWBIE_ENGINE __declspec( dllexport )
	#else
		#define NB_API_NEWBIE_ENGINE __declspec( dllimport )
	#endif
#else
	#define NB_API_NEWBIE_ENGINE
#endif

#endif
