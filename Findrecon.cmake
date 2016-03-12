#
# This CMake Module locates the recon Utility Library,
# enabling FIND_PACKAGE(recon) to work.
#

SET(recon_DIR "" CACHE PATH "Root path of librecon")

FIND_PATH(Recon_INCLUDE_DIR NAMES recon/recon.h
        HINTS ${recon_DIR}/include)
MARK_AS_ADVANCED(Recon_INCLUDE_DIR)


FIND_LIBRARY(Recon_LIBRARY NAMES recon
        HINTS ${recon_DIR}/lib/Release)
MARK_AS_ADVANCED(Recon_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Recon DEFAULT_MSG Recon_LIBRARY Recon_INCLUDE_DIR)

IF ("${Recon_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (Recon_LIBRARY)
    SET (Recon_INCLUDE_DIR)
ELSEIF ("${Recon_LIBRARY}" MATCHES "NOTFOUND")
    SET (Recon_LIBRARY)
    SET (Recon_INCLUDE_DIR)
ELSE ("${Recon_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (recon_FOUND 1)
    SET (recon_LIBRARIES ${Recon_LIBRARY})
    SET (Recon_INCLUDE_DIRS ${Recon_INCLUDE_DIR})
ENDIF ("${Recon_INCLUDE_DIR}" MATCHES "NOTFOUND")
