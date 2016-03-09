#
# This CMake Module locates the recon Utility Library,
# enabling FIND_PACKAGE(recon) to work.
#

SET(recon_DIR /home/elresidente/Develop/Repository/librecon)
FIND_PATH(recon_INCLUDE_DIR NAMES recon/recon.h
        HINTS ${recon_DIR}/include)
MARK_AS_ADVANCED(recon_INCLUDE_DIR)

FIND_LIBRARY(recon_LIBRARY NAMES librecon.a recon
        HINTS ${recon_DIR}/lib)
MARK_AS_ADVANCED(recon_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(recon DEFAULT_MSG recon_LIBRARY recon_INCLUDE_DIR)

IF ("${recon_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (recon_LIBRARY)
    SET (recon_INCLUDE_DIR)
ELSEIF ("${recon_LIBRARY}" MATCHES "NOTFOUND")
    SET (recon_LIBRARY)
    SET (recon_INCLUDE_DIR)
ELSE ("${recon_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (recon_FOUND 1)
    SET (recon_LIBRARIES ${recon_LIBRARY})
    SET (recon_INCLUDE_DIRS ${recon_INCLUDE_DIR})
ENDIF ("${recon_INCLUDE_DIR}" MATCHES "NOTFOUND")
