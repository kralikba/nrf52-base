# Boards

if(DEFINED BOARD)
include_directories(${CMAKE_CURRENT_LIST_DIR})
set(SOURCES ${SOURCES} ${CMAKE_CURRENT_LIST_DIR}/boards.c)
endif()