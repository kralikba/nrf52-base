#ARM none eabi gcc toolchain configuration

# Indicate we aren't compiling for an OS
set(CMAKE_SYSTEM_NAME Generic)

# Set processor type
set(CMAKE_SYSTEM_PROCESSOR arm)

set(TOOLCHAIN gcc)

# Set compiler paths. We force set so it doesn't run tests
set(CMAKE_C_COMPILER ${COMPILER_PREFIX}arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER ${COMPILER_PREFIX}arm-none-eabi-g++)

set(CMAKE_ASM_COMPILER ${COMPILER_PREFIX}arm-none-eabi-g++)
set(CMAKE_RANLIB ${COMPILER_PREFIX}arm-none-eabi-ranlib)
set(CMAKE_AR ${COMPILER_PREFIX}arm-none-eabi-ar CACHE FILEPATH "ar")

set(CMAKE_LINKER ${COMPILER_PREFIX}arm-none-eabi-ld CACHE FILEPATH "default_ld")

# Removes invalid (default) flags on OSX
SET(CMAKE_C_LINK_FLAGS "")
SET(CMAKE_CXX_LINK_FLAGS "")

# Set other tools
set(OBJSIZE ${COMPILER_PREFIX}arm-none-eabi-size)
set(OBJCOPY ${COMPILER_PREFIX}arm-none-eabi-objcopy)
set(OBJDUMP ${COMPILER_PREFIX}arm-none-eabi-objdump)
set(DEBUGGER ${COMPILER_PREFIX}arm-none-eabi-gdb)

# Remove preset linker flags
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "") 
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") 
set(CMAKE_SHARED_LIBRARY_LINK_ASM_FLAGS "")

# Set library options
set(SHARED_LIBS OFF)
set(STATIC_LIBS ON)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)