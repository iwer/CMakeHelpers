#
# This CMake Module locates the Dude Utility Library,
# enabling FIND_PACKAGE(Dude) to work.
#

SET(dude_DIR "" CACHE PATH "Root path of libdude")
FIND_PATH(Dude_INCLUDE_DIR NAMES dude/dude.h
        HINTS ${dude_DIR}/include)
MARK_AS_ADVANCED(Dude_INCLUDE_DIR)

FIND_LIBRARY(Dude_LIBRARY NAMES libdude.a dude
        HINTS ${dude_DIR}/lib)
MARK_AS_ADVANCED(Dude_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Dude DEFAULT_MSG Dude_LIBRARY Dude_INCLUDE_DIR)

IF ("${Dude_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (Dude_LIBRARY)
    SET (Dude_INCLUDE_DIR)
ELSEIF ("${Dude_LIBRARY}" MATCHES "NOTFOUND")
    SET (Dude_LIBRARY)
    SET (Dude_INCLUDE_DIR)
ELSE ("${Dude_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (Dude_FOUND 1)
    SET (Dude_LIBRARIES ${Dude_LIBRARY})
    SET (Dude_INCLUDE_DIRS ${Dude_INCLUDE_DIR})
ENDIF ("${Dude_INCLUDE_DIR}" MATCHES "NOTFOUND")
