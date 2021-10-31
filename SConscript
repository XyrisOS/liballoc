Import('env')

env = env.Clone()
env.Append(
    CPPPATH='.'
)

lib = env.StaticLibrary(
    'alloc',
    ['liballoc.c'],
)

Return('lib')
