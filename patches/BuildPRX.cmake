function(build_prx elf)
	set(BUILD_PRX TRUE)
	set(_PRX_FLAGS "-g3 -specs=${PSPSDK}/lib/prxspecs -Wl,-q,-T${PSPSDK}/lib/linkfile.prx")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS_DEBUG} ${PRX_FLAGS}")
	set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS_DEBUG} ${PRX_FLAGS}")

	add_custom_command(
		TARGET ${elf}
		POST_BUILD COMMAND
		${PRXGEN} ${elf} ${elf}.prx
	)
endfunction()
