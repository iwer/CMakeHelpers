find_package(UnitTestPlusPlus REQUIRED)
add_library(unittestpp STATIC IMPORTED)
set_property(TARGET unittestpp PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${UnitTestPlusPlus_INCLUDE_DIRS})
set_property(TARGET unittestpp PROPERTY 
	IMPORTED_LOCATION_RELEASE ${UnitTestPlusPlus_LIBRARY})
set_property(TARGET unittestpp PROPERTY 
	IMPORTED_LOCATION_DEBUG ${UnitTestPlusPlus_LIBRARY_DEBUG})