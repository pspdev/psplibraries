# File defining macro outputting PSP-specific EBOOT.PBP out of passed executable target.
# Copyright 2020 - Daniel 'dbeef' Zalega
#
# Args:
# TARGET - defined by an add_executable call before calling create_pbp_file
# TITLE - optional, string, target's name in PSP menu
# BUILD_PRX - optional, generates and uses PRX file instead of ELF in EBOOT.PBP
# ICON_PATH - optional, absolute path to .png file, 144x82
# BACKGROUND_PATH - optional, absolute path to .png file, 480x272
# PREVIEW_PATH - optional, absolute path to .png file, 480x272
#
cmake_minimum_required(VERSION 3.10)

macro(create_pbp_file)

  set(options BUILD_PRX)
  set(oneValueArgs TARGET TITLE ICON_PATH BACKGROUND_PATH PREVIEW_PATH)
  cmake_parse_arguments("ARG" "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  # As pack-pbp takes undefined arguments in form of "NULL" string,
  # set each undefined macro variable to such value:
  foreach(arg ${oneValueArgs})
    if (NOT DEFINED ARG_${arg})
      set(ARG_${arg} "NULL")
    endif()
  endforeach()

  if(${ARG_BUILD_PRX})
    target_link_options(${ARG_TARGET}
      PUBLIC -specs=/usr/local/pspdev/psp/sdk/lib/prxspecs
      PUBLIC -Wl,-q,-T/usr/local/pspdev/psp/sdk/lib/linkfile.prx
      PUBLIC /usr/local/pspdev/psp/sdk/lib/prxexports.o)
  endif()

  if("${CMAKE_BUILD_TYPE}" STREQUAL "Release" AND NOT ${ARG_BUILD_PRX})
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      "${STRIP}" "$<TARGET_FILE:${ARG_TARGET}>"
      COMMENT "Stripping binary"
      )
  elseif(${ARG_BUILD_PRX})
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      ${CMAKE_COMMAND} -E cmake_echo_color --cyan "Not stripping binary because building PRX."
      )
  else()
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      ${CMAKE_COMMAND} -E cmake_echo_color --cyan "Not stripping binary, build type is ${CMAKE_BUILD_TYPE}."
      )
  endif()

  add_custom_command(
    TARGET ${ARG_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory
    $<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact
    COMMENT "Creating psp_artifact directory."
    )

  add_custom_command(
    TARGET ${ARG_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    $<TARGET_FILE:${ARG_TARGET}>
    "$<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact/${ARG_TARGET}.elf"
    COMMENT "Copying ELF to psp_arfitact directory."
    )

  add_custom_command(
    TARGET ${ARG_TARGET}
    POST_BUILD COMMAND
    "${FIXUP}" "$<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact/${ARG_TARGET}.elf"
    COMMENT "Calling psp-fixup-imports"
    )

  if (${ARG_BUILD_PRX})
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      "${PRXGEN}" "$<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact/${ARG_TARGET}.elf" "$<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact/${ARG_TARGET}.prx"
      COMMENT "Calling prxgen"
      )
  else()
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      ${CMAKE_COMMAND} -E cmake_echo_color --cyan "Not building PRX"
      )
  endif()
  
  add_custom_command(
    TARGET ${ARG_TARGET}
    POST_BUILD COMMAND
    "${MKSFOEX}" "-d" "MEMSIZE=1" "${ARG_TITLE}" "PARAM.SFO"
    COMMENT "Calling mksfoex"
    )

  if(${ARG_BUILD_PRX})
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      "${PACK_PBP}" "EBOOT.PBP" "PARAM.SFO" "${ARG_ICON_PATH}" "NULL" "${ARG_PREVIEW_PATH}"
      "${ARG_BACKGROUND_PATH}" "NULL" "$<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact/${ARG_TARGET}.prx" "NULL"
      COMMENT "Calling pack-pbp with PRX file"
      )
  else()
    add_custom_command(
      TARGET ${ARG_TARGET}
      POST_BUILD COMMAND
      "${PACK_PBP}" "EBOOT.PBP" "PARAM.SFO" "${ARG_ICON_PATH}" "NULL" "${ARG_PREVIEW_PATH}"
      "${ARG_BACKGROUND_PATH}" "NULL" "$<TARGET_FILE_DIR:${ARG_TARGET}>/psp_artifact/${ARG_TARGET}.elf" "NULL"
      COMMENT "Calling pack-pbp with ELF file"
      )
  endif()

  add_custom_command(
    TARGET ${ARG_TARGET}
    POST_BUILD COMMAND
    ${CMAKE_COMMAND} -E cmake_echo_color --cyan "EBOOT.PBP file created."
    )
  
endmacro()
