if(WIN32)
	SET(Boost_COMPILER "-vc140")
endif()
set(Boost_ADDITIONAL_VERSIONS "1.47" "1.47.0" "1.60" "1.60.0")
find_package(Boost COMPONENTS "chrono" "date_time" "filesystem" "graph" "iostreams" "program_options" "regex" "serialization" "signals" "system" "thread" "wserialization" REQUIRED)
link_directories(${Boost_LIBRARY_DIRS})

add_library(boost-datetime STATIC IMPORTED)
set_property(TARGET boost-datetime PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-datetime PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_DATE_TIME_LIBRARY_RELEASE})
set_property(TARGET boost-datetime PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_DATE_TIME_LIBRARY_DEBUG})

add_library(boost-filesystem STATIC IMPORTED)
set_property(TARGET boost-filesystem PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-filesystem PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_FILESYSTEM_LIBRARY_RELEASE})
set_property(TARGET boost-filesystem PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_FILESYSTEM_LIBRARY_DEBUG})

add_library(boost-system STATIC IMPORTED)
set_property(TARGET boost-system PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-system PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_SYSTEM_LIBRARY_RELEASE})
set_property(TARGET boost-system PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_SYSTEM_LIBRARY_DEBUG})

add_library(boost-chrono STATIC IMPORTED)
set_property(TARGET boost-chrono PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-chrono PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_CHRONO_LIBRARY_RELEASE})
set_property(TARGET boost-chrono PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_CHRONO_LIBRARY_DEBUG})

add_library(boost-iostreams STATIC IMPORTED)
set_property(TARGET boost-iostreams PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-iostreams PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_IOSTREAMS_LIBRARY_RELEASE})
set_property(TARGET boost-iostreams PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_IOSTREAMS_LIBRARY_DEBUG})

add_library(boost-serialization STATIC IMPORTED)
set_property(TARGET boost-serialization PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-serialization PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_SERIALIZATION_LIBRARY_RELEASE})
set_property(TARGET boost-serialization PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_SERIALIZATION_LIBRARY_DEBUG})

add_library(boost-thread STATIC IMPORTED)
set_property(TARGET boost-thread PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-thread PROPERTY 
	IMPORTED_LOCATION_RELEASE ${Boost_THREAD_LIBRARY_RELEASE})
set_property(TARGET boost-thread PROPERTY 
	IMPORTED_LOCATION_DEBUG ${Boost_THREAD_LIBRARY_DEBUG})
