# - Try to find WinPcap
#
# Sets the following variables:
#
#  WINPCAP_FOUND - if package found
#  WINPCAP_INCLUDE_DIRS - include directories
#  WINPCAP_LIBRARIES    - libraries
#

SET(WINPCAP_DIR "" CACHE PATH "Root path of WinPCAP")

find_path(WINPCAP_INCLUDE_DIR NAMES pcap.h
		${WINPCAP_DIR}/Include
)

find_library(WINPCAP_LIBRARY_PACKET Packet
		${WINPCAP_DIR}/Lib
)

find_library(WINPCAP_LIBRARY_WPCAP wpcap
		${WINPCAP_DIR}/Lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(WinPcap DEFAULT_MSG 
	WINPCAP_INCLUDE_DIR
	WINPCAP_LIBRARY_PACKET
	WINPCAP_LIBRARY_WPCAP
)

if(WINPCAP_FOUND)
	set(WINPCAP_INCLUDE_DIRS ${WINPCAP_INCLUDE_DIR})
	set(WINPCAP_LIBRARIES ${WINPCAP_LIBRARY_PACKET} ${WINPCAP_LIBRARY_WPCAP})
else()
	set(WINPCAP_INCLUDE_DIRS)
	set(WINPCAP_LIBRARIES)
endif()

mark_as_advanced(WINPCAP_LIBRARIES WINPCAP_INCLUDE_DIRS)
