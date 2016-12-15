# 
# Generates version file with build number.
# 
# Call like:
# 
# file(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/build-number BUILDNO_FILE)
# file(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/last-buildno LAST_BUILDNO_FILE)
# 
# file(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/include/dude/version.h.in.cmake CONFIG_FILE)
# file(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/include/dude/version.h VERSION_HEADER)
# 
# add_custom_target(
# 	libdude_version
# 	${CMAKE_COMMAND} -D SRC=${CONFIG_FILE}
# 					 -D DST=${VERSION_HEADER}
# 					 -D VERFILE=${BUILDNO_FILE}
# 					 -D LASTVERFILE=${LAST_BUILDNO_FILE}
# 					 -D APPLICATION_VERSION_MAJOR=${APPLICATION_VERSION_MAJOR}
# 					 -D APPLICATION_VERSION_MINOR=${APPLICATION_VERSION_MINOR}
# 					 -D APPLICATION_VERSION_PATCH=${APPLICATION_VERSION_PATCH}
# 					 -D APPLICATION_VERSION_TYPE=${APPLICATION_VERSION_TYPE}
# 					 -P ${CMAKE_MODULE_PATH}/version.cmake
# )
# add_dependencies(libdude libdude_version)


#ADD_DEPENDENCIES(main version)

#determine cat command
if(WIN32)
	set(CAT_EXE cmd /c type)
endif(WIN32)
if(UNIX)
	set(CAT_EXE cat)
endif(UNIX)

# check if build number file exists and create if not
if(EXISTS ${VERFILE})
else()
	file(WRITE ${VERFILE} "1")
endif()

# determine current build number
execute_process(
    COMMAND ${CAT_EXE} ${VERFILE}
    OUTPUT_VARIABLE APPLICATION_VERSION_BUILD
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# build version string
set (APPLICATION_VERSION_STRING "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}.${APPLICATION_VERSION_PATCH}.${APPLICATION_VERSION_BUILD}${APPLICATION_VERSION_TYPE}") 
message(STATUS " Version: ${APPLICATION_VERSION_STRING}")

# determine last build number
execute_process(
    COMMAND ${CAT_EXE} ${LASTVERFILE}
    OUTPUT_VARIABLE LAST_BUILDNO
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
message(STATUS " Last Build no: ${LAST_BUILDNO}")

# if last build number smaller than generate version.h from version.h.in
if(${LAST_BUILDNO} LESS ${APPLICATION_VERSION_BUILD})
	file(WRITE ${LASTVERFILE} "${APPLICATION_VERSION_BUILD}")
	message(STATUS " Generating ${DST} from ${SRC}")
	configure_file(${SRC} ${DST} @ONLY)
endif()