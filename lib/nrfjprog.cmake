# JLink functions
# Adds targets for JLink programmers and emulators

# Configure flasher script for the project
set(HEX ${TARGET}.hex)

if(CMAKE_BUILD_TYPE MATCHES DEBUG)
	#Add JLink commands
	add_custom_target(debug
		COMMAND ${DEBUGGER} -tui -command ${CMAKE_CURRENT_LIST_DIR}/remote.gdbconf ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}
		DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}
		)

	add_custom_target(debug-server
		COMMAND JLinkGDBServerCL -device ${CPU_FAMILY_L} -speed 4000 -if SWD -strict -endian little
		DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}
		)
endif()

add_custom_target(flash 
	COMMAND nrfjprog --program ${HEX} --sectorerase --reset
	DEPENDS ${TARGET}.hex
	)

add_custom_target(flash-softdevice 
	COMMAND nrfjprog --program ${SOFTDEVICE_HEX} --sectoranduicrerase --reset
	DEPENDS ${TARGET}.hex
	)

add_custom_target(erase 
	COMMAND nrfjprog --recover
	)

add_custom_target(reset 
	COMMAND nrfjprog --reset
	)
