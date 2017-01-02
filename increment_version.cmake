# 
# increment build-number pre-build
#
# when "last-buildno" equals "build-number", this script increments the value of "build-number".
#
# call like:
#
# file(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/build-number BUILDNO_FILE)
# file(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/last-buildno LAST_BUILDNO_FILE)
#
# add_custom_command(TARGET main
#                    PRE_BUILD
#                    COMMAND ${CMAKE_COMMAND} 
# 						   -D VERFILE=${BUILDNO_FILE}
# 						   -D LASTVERFILE=${LAST_BUILDNO_FILE}
# 						   -P ${CMAKE_MODULE_PATH}/increment_version.cmake
# )


#determine cat command
if(WIN32)
	set(CAT_EXE cmd /c type)
endif(WIN32)
if(UNIX)
	set(CAT_EXE cat)
endif(UNIX)

# check if build number files exists and create if not
if(EXISTS ${VERFILE})
else()
	file(WRITE ${VERFILE} "1")
endif()
if(EXISTS ${LASTVERFILE})
else()
	file(WRITE ${LASTVERFILE} "0")
endif()

# get current build number from file
execute_process(
	COMMAND ${CAT_EXE} ${VERFILE}
	OUTPUT_VARIABLE APPLICATION_VERSION_BUILD
	OUTPUT_STRIP_TRAILING_WHITESPACE
)

# get build number of last version
execute_process(
    COMMAND ${CAT_EXE} ${LASTVERFILE}
    OUTPUT_VARIABLE LAST_BUILDNO
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

message(STATUS " Last Build no: ${LAST_BUILDNO}, current ${APPLICATION_VERSION_BUILD}")


# if last buildno equals current buildno, increment and write back to current
if(${LAST_BUILDNO} EQUAL ${APPLICATION_VERSION_BUILD})
	message(STATUS " Incrementing build number in ${VERFILE}")
	math(EXPR APPLICATION_VERSION_BUILD "${APPLICATION_VERSION_BUILD} + 1")
	file(WRITE ${VERFILE} "${APPLICATION_VERSION_BUILD}")
endif()
