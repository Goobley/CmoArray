from PyData import PyDoStuff
import numpy as np

a = np.random.randn(10,10,10,10)
ds = PyDoStuff(a)
# b and a are seperate numpy arrays, but backed by the same data
b = ds.data

print('a[1,3,4,8] = %f' % a[1,3,4,8])
print('Mutating in C++')
ds.mutate()
print('a[1,3,4,8] = %f' % a[1,3,4,8])
print('b[1,3,4,8] = %f' % b[1,3,4,8])

print('a[1,2,3,:] = %s' % repr(a[1,2,3]))
print('Assigning range to slice')
a[1,2,3,:] = np.arange(10)
print('Printing updated value from C++:')
ds.print_cpp()
print('b[1,2,3,:] = %s' % repr(b[1,2,3]))



