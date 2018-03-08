SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)
SET(CMAKE_CROSSCOMPILING TRUE)

# set compiler
set(CMAKE_C_COMPILER psp-gcc)
set(CMAKE_CXX_COMPILER psp-g++)

SET(BUILD_SHARED_LIBS FALSE)
SET(CMAKE_EXECUTABLE_SUFFIX ".elf")

# set find root path
execute_process(COMMAND psp-config --pspsdk-path
  OUTPUT_VARIABLE PSPSDK_PATH
  OUTPUT_STRIP_TRAILING_WHITESPACE)

execute_process(COMMAND psp-config --psp-prefix
  OUTPUT_VARIABLE PSP_PREFIX
  OUTPUT_STRIP_TRAILING_WHITESPACE)

set(CMAKE_FIND_ROOT_PATH "${PSPSDK_PATH};${PSP_PREFIX}")
include_directories(SYSTEM "${PSPSDK_PATH}/include;${PSP_PREFIX}/include")

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# reduce link error
ADD_DEFINITIONS("-G0")

# linker flags
set(PSP_LIBRARIES "-lpspdebug -lpspdisplay -lpspge -lpspctrl -lc -lpspsdk -lc -lpspnet -lpspnet_inet -lpspnet_apctl -lpspnet_resolver -lpspaudiolib -lpsputility -lpspuser -lpspkernel -L${PSPSDK_PATH}/lib -L${PSP_PREFIX}/lib")
set(CMAKE_C_STANDARD_LIBRARIES "${PSP_LIBRARIES}")
set(CMAKE_CXX_STANDARD_LIBRARIES "-lstdc++ ${PSP_LIBRARIES}")
