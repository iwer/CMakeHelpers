find_package(WinPCAP REQUIRED)
add_library(packet STATIC IMPORTED)
set_property(TARGET packet PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${WINPCAP_INCLUDE_DIRS})
set_property(TARGET packet PROPERTY 
	IMPORTED_LOCATION ${WINPCAP_LIBRARY_PACKET})

add_library(winpcap STATIC IMPORTED)
set_property(TARGET winpcap PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${WINPCAP_INCLUDE_DIRS})
set_property(TARGET winpcap PROPERTY 
	IMPORTED_LOCATION ${WINPCAP_LIBRARY_WPCAP})
set_property(TARGET winpcap PROPERTY INTERFACE_COMPILE_DEFINITIONS
	WPCAP
	HAVE_REMOTE)