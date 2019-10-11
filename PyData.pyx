import numpy as np
cimport numpy as np

from CmoArray cimport F64View4D

cdef extern from "Example.hpp":
    cdef cppclass DoStuff:
        DoStuff()
        DoStuff(F64View4D)
        void mutate_cpp()
        void print_cpp()

cdef class PyDoStuff:
    cdef DoStuff stuff
    cdef double[:, :, :, ::1] data

    def __init__(self, double[:, :, :, ::1] data):
        self.data = data
        cdef F64View4D d = F64View4D(&data[0,0,0,0], data.shape[0], data.shape[1], data.shape[2], data.shape[3])
        self.stuff = DoStuff(d)

    # Uses C++ to multiply entry 1, 3, 4, 8 by 3
    def mutate(self):
        self.stuff.mutate_cpp()

    # Prints slice [1, 2, 3, :] from C++
    def print_cpp(self):
        self.stuff.print_cpp()

    # Returns a numpy array backed by the _same_ data
    @property
    def data(self):
        return np.asarray(self.data)