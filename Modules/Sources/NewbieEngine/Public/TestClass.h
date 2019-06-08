#ifndef NB_NEWBIE_ENGINE_TEST_CLASS_H
#define NB_NEWBIE_ENGINE_TEST_CLASS_H

#include "Settings.h"

namespace NewbieEngine
{
    class TestClass
    {
    public:
        NB_API_NEWBIE_ENGINE TestClass();
        NB_API_NEWBIE_ENGINE ~TestClass();

        NB_API_NEWBIE_ENGINE int GetInteger();
    };
}

#endif
