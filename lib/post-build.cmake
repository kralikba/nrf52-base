
# ARM post build commands

# Create binary file
add_custom_target(${TARGET}.bin COMMAND ${OBJCOPY} -O binary ${TARGET} ${TARGET}.bin DEPENDS ${TARGET})

add_custom_target(${TARGET}.hex COMMAND ${OBJCOPY} -O ihex ${TARGET} ${TARGET}.hex DEPENDS ${TARGET})

add_custom_target(${TARGET}.dmp COMMAND ${OBJDUMP} -d -S ${TARGET} > ${TARGET}.dmp DEPENDS ${TARGET})

add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND ${OBJSIZE} ${TARGET})