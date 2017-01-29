#
# This CMake Module locates the UnitTest++ (http://unittest-cpp.sourceforge.net/)
# C++ unit testing framework, enabling FIND_PACKAGE(UnitTestPlusPlus) to work. 
#
if(MSVC)
    SET(unittestplusplus_DIR "" CACHE PATH "Root path of UnitTest++")
endif(MSVC)

SET(unittestplusplus_DIR "/usr/lib" CACHE PATH "Root path of UnitTest++")

FIND_PATH(UnitTestPlusPlus_INCLUDE_DIR NAMES unittest++/UnitTest++.h
	HINTS ${unittestplusplus_DIR}/include)
MARK_AS_ADVANCED(UnitTestPlusPlus_INCLUDE_DIR)

FIND_LIBRARY(UnitTestPlusPlus_LIBRARY NAMES UnitTest++
	HINTS ${unittestplusplus_DIR}/lib)
MARK_AS_ADVANCED(UnitTestPlusPlus_LIBRARY)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(UnitTestPlusPlus DEFAULT_MSG UnitTestPlusPlus_LIBRARY UnitTestPlusPlus_INCLUDE_DIR)

if(WIN32)
        FIND_LIBRARY(UnitTestPlusPlus_LIBRARY_DEBUG NAMES UnitTest++d
	        HINTS ${unittestplusplus_DIR}/lib)
        MARK_AS_ADVANCED(UnitTestPlusPlus_LIBRARY_DEBUG)
        FIND_PACKAGE_HANDLE_STANDARD_ARGS(UnitTestPlusPlus DEFAULT_MSG UnitTestPlusPlus_LIBRARY_DEBUG)
endif()

IF ("${UnitTestPlusPlus_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (UnitTestPlusPlus_LIBRARY)
	SET (UnitTestPlusPlus_LIBRARY_DEBUG)
    SET (UnitTestPlusPlus_INCLUDE_DIR)
ELSEIF ("${UnitTestPlusPlus_LIBRARY}" MATCHES "NOTFOUND")
    SET (UnitTestPlusPlus_LIBRARY)
	SET (UnitTestPlusPlus_LIBRARY_DEBUG)
    SET (UnitTestPlusPLus_INCLUDE_DIR)
ELSE ("${UnitTestPlusPlus_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (UnitTestPlusPlus_FOUND 1)
    SET (UnitTestPlusPlus_LIBRARIES ${UnitTestPlusPlus_LIBRARY})
    SET (UnitTestPlusPlus_INCLUDE_DIRS ${UnitTestPlusPlus_INCLUDE_DIR})
ENDIF ("${UnitTestPlusPlus_INCLUDE_DIR}" MATCHES "NOTFOUND")
