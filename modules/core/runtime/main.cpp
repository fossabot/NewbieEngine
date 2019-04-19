#include <iostream>

int main()
{
#if defined(NB_DEVELOPMENT)
	std::cout << "DEVELOPMENT" << std::endl;
#elif defined(NB_DEBUG)
	std::cout << "DEBUG" << std::endl;
#elif defined(NB_RELEASE)
	std::cout << "RELEASE" << std::endl;
#endif

    return 0;
}