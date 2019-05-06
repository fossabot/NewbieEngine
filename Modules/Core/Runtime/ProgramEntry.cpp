#include <iostream>

int main(void)
{
#if NB_DEVELOPMENT
    std::cout << "Newbie plays on DEVELOPMENT" << std::endl;
#elif NB_DEBUG
    std::cout << "Newbie plays on DEBUG" << std::endl;
#elif NB_RELEASE
    std::cout << "Newbie plays on RELEASE" << std::endl;
#else
    std::cerr << "ERROR CONFIGURATION" << std::endl;
    return -1;
#endif

    return 0;
}