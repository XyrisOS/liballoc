Import('env')

env = env.Clone()
env.Append(
    CPPPATH='.'
)

liballoc = env.StaticLibrary(
    'alloc',
    [
        'liballoc.c'
    ],
)

# liballoc 1.1 needs updating to work with the Xyris toolchain
# (currently doesn't compile due to more pedantic compiler flags)
# liballoc_1_1 = env.StaticLibrary(
#     'alloc_1_1',
#     [
#         'liballoc_1_1.c'
#     ],
# )

Return('liballoc')
