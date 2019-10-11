#include "Example.hpp"

DoStuff::DoStuff(F64View4D d) : seq(d)
{}

DoStuff::DoStuff() : seq()
{}

void DoStuff::mutate_cpp()
{
    seq(1, 3, 4, 8) *= 3;
}

void DoStuff::print_cpp() const
{
    auto a = seq(1, 2, 3);
    for (int i = 0; i < a.shape(0); ++i)
        printf("%f, ", a(i));
    // NOTE(cmo): Uncommenting this line will trigger a compile error, as the type system protects us from assigning to a slice taken in a const function
    // a(1) = 3.0;
    printf("\n");

}
