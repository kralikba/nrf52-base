# Library Module

# Add source files

set(NRF_LIB_SOURCES "")

foreach(LIBRARY IN ITEMS ${LIBRARIES})
	# Call custom script if there is one; otherwise just include everything from that library
	set(CUSTOM_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/${LIBRARY}.cmake")
	if(EXISTS ${CUSTOM_SCRIPT})
		include(${CUSTOM_SCRIPT})
	else()
		message("Added library: ${LIBRARY} at: ${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}")
		file(GLOB_RECURSE CURRENT_SOURCES ${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/*.c)
		set(NRF_LIB_SOURCES ${NRF_LIB_SOURCES} ${CURRENT_SOURCES})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${LIBRARY})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/src)
	endif()
endforeach(LIBRARY IN ${LIBRARIES})

# Create ble library
add_library(libraries ${NRF_LIB_SOURCES})

set(LIBS ${LIBS} libraries)