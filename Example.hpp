#ifndef EXAMPLE_HPP
#define EXAMPLE_HPP

#include "CmoArray.hpp"

class DoStuff
{
    F64View4D seq;

public:
    DoStuff();
    DoStuff(F64View4D d);
    void mutate_cpp();
    void print_cpp() const;
};

#else
#endif