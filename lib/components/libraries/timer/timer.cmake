#TODO: include other .c files if RTOS flag set
set(NRF_LIB_SOURCES
        ${NRF_LIB_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/app_timer.c
        )
include_directories(${CMAKE_CURRENT_LIST_DIR})