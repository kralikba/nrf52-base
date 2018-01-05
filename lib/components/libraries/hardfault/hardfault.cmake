set(NRF_LIB_SOURCES
        ${NRF_LIB_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/${CPU_FAMILY_L}/handler/hardfault_handler_${TOOLCHAIN}.c
        ${CMAKE_CURRENT_LIST_DIR}/hardfault_implementation.c
        )
include_directories(${CMAKE_CURRENT_LIST_DIR})