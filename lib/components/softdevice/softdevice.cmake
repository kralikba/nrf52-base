# Softdevice inclusion

if(DEFINED SOFTDEVICE)

include_directories(${CMAKE_CURRENT_LIST_DIR}/common/softdevice_handler)

string(TOLOWER ${SOFTDEVICE} SOFTDEVICE_L)

if(NOT SOFTDEVICE_VERSION)
set(SOFTDEVICE_VERSION "2.0.0")
endif()

message("Using softdevice: ${SOFTDEVICE} Version: ${SOFTDEVICE_VERSION}")

if(NOT CUSTOM_LD)
if(NOT FLASH_START)
if(SOFTDEVICE STREQUAL "S132")
	set(FLASH_START 0x1c000)
elseif(SOFTDEVICE STREQUAL "S212")
	set(FLASH_START 0x12000)
endif()
message("Automatically selected flash start address: ${FLASH_START}")

if(NOT DEFINED SOFTDEVICE_LD)
	set(SOFTDEVICE_LD ${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/toolchain/armgcc/armgcc_${SOFTDEVICE_L}_${DEVICE_L}_xxaa.ld)
	message("Using softdevice linker script: ${SOFTDEVICE_LD}")
endif()
endif(NOT FLASH_START)
endif(NOT CUSTOM_LD)

file(GLOB_RECURSE HEADERS
		${CMAKE_CURRENT_LIST_DIR}/common/*.h
		${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/*.h
	)

set(SOFTDEVICE_SOURCES
	${CMAKE_CURRENT_LIST_DIR}/common/nrf_sdh.c
	${CMAKE_CURRENT_LIST_DIR}/common/nrf_sdh_ant.c
	${CMAKE_CURRENT_LIST_DIR}/common/nrf_sdh_ble.c
	${CMAKE_CURRENT_LIST_DIR}/common/nrf_sdh_soc.c
	${HEADERS}
)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/common
	${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/headers
	${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/headers/nrf52
	)

set(SOFTDEVICE_HEX ${CMAKE_CURRENT_LIST_DIR}/${SOFTDEVICE_L}/hex/${SOFTDEVICE_L}_${CPU_FAMILY_L}_${SOFTDEVICE_VERSION}_softdevice.hex)
set(SOFTDEVICE_BIN ${SOFTDEVICE_L}_${CPU_FAMILY_L}_${SOFTDEVICE_VERSION}_softdevice.bin)

message("Using softdevice binary: ${SOFTDEVICE_HEX}")

add_custom_target(softdevice-bin ALL COMMAND ${OBJCOPY} -I ihex -O binary ${SOFTDEVICE_HEX} ${SOFTDEVICE_BIN})

add_library(softdevice ${SOFTDEVICE_SOURCES})

set(LIBS ${LIBS} softdevice)

endif(DEFINED SOFTDEVICE)