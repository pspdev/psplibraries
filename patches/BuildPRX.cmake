macro(build_prx elf)
	add_custom_command(
		TARGET ${elf}
		POST_BUILD COMMAND
		${PRXGEN} ${elf} ${elf}.prx
	)
endmacro()
