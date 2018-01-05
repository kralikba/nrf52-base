set(MMD TRUE)

set(HEADERS ${HEADERS}
        ${CMAKE_CURRENT_LIST_DIR}/JLINK_MONITOR.h
        )
set(SOURCES ${SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/JLINK_MONITOR.c
        ${CMAKE_CURRENT_LIST_DIR}/JLINK_MONITOR_ISR_SES.s
        )

add_definitions(-DMMD=1)

include_directories(${CMAKE_CURRENT_LIST_DIR})

set(HOME $ENV{HOME})
if(NOT HOME)
    message(FATAL_ERROR "HOME must be set for monitor mode debugging")
endif()

set(GDBINIT ${HOME}/.gdbinit)

message("Overwriting ${GDBINIT} for debugging current target in monitor mode...")
configure_file(${CMAKE_CURRENT_LIST_DIR}/gdbinit.in ${GDBINIT})

