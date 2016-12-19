if(WIN32)
    find_package(UnitTestPlusPlus REQUIRED)
    message(STATUS "UTPP: ${UnitTestPlusPlus_INCLUDE_DIRS} ${UnitTestPlusPlus_LIBRARY}")
    add_library(unittestpp STATIC IMPORTED)
    set_property(TARGET unittestpp PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${UnitTestPlusPlus_INCLUDE_DIRS})
    set_property(TARGET unittestpp PROPERTY 
        IMPORTED_LOCATION_RELEASE ${UnitTestPlusPlus_LIBRARY})
    set_property(TARGET unittestpp PROPERTY 
        IMPORTED_LOCATION_DEBUG ${UnitTestPlusPlus_LIBRARY_DEBUG})
endif(WIN32)

if(UNIX)
    find_package(UnitTest++ REQUIRED)

#    include(FindPkgConfig)
#    pkg_search_module(UNITTESTPP REQUIRED unittest++)
#    message(STATUS "UTPP: ${UNITTESTPP_INCLUDEDIR} ${UNITTESTPP_LIBRARIES}")
#    add_library(unittestpp INTERFACE IMPORTED)
#    set_property(TARGET unittestpp PROPERTY
#            INTERFACE_INCLUDE_DIRECTORIES ${UNITTESTPP_INCLUDEDIR})
#    set_property(TARGET unittestpp PROPERTY
#            INTERFACE_LINK_LIBRARIES ${UNITTESTPP_LIBRARIES})
#    set_property(TARGET unittestpp PROPERTY
#            INTERFACE_POSITION_INDEPENDENT_CODE ON)

endif(UNIX)

