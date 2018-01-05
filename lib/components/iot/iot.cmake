# Library Module

# Add source files

set(NRF_IOT_SOURCES "")

if(IPSTACK STREQUAL "NRF_IPV6")
	set(IOT ${IOT} ipv6_stack ipv6_parse)
endif()

if(IOT)
	list(APPEND IOT common)

	list(REMOVE_DUPLICATES IOT)

	foreach(LIBRARY IN ITEMS ${IOT})
		# Call custom script if there is one; otherwise just include everything from that library
		set(CUSTOM_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/${LIBRARY}.cmake")
		if(EXISTS "${CUSTOM_SCRIPT}")
			include(${CUSTOM_SCRIPT})
		else()
			message("Added IoT library: ${LIBRARY} at: ${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}")
			file(GLOB_RECURSE CURRENT_SOURCES ${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/*.c)
			set(NRF_IOT_SOURCES ${NRF_IOT_SOURCES} ${CURRENT_SOURCES})
			include_directories(${CMAKE_CURRENT_LIST_DIR}/${LIBRARY})
			include_directories(${CMAKE_CURRENT_LIST_DIR}/${LIBRARY}/src)
		endif()
	endforeach(LIBRARY IN ${IOT})

	# Create ble library
	add_library(iot ${NRF_IOT_SOURCES})

	set(LIBS ${LIBS} iot)
endif()