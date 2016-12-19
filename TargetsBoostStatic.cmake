if(WIN32)
	SET(Boost_COMPILER "-vc140")
endif()
set(Boost_ADDITIONAL_VERSIONS "1.47" "1.47.0" "1.60" "1.60.0" "1.61" "1.61.0")
find_package(Boost COMPONENTS "chrono" "date_time" "filesystem" "graph" "iostreams" "program_options" "regex" "serialization" "signals" "system" "thread" "wserialization" REQUIRED)
link_directories(${Boost_LIBRARY_DIRS})

if(WIN32)
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
	
    add_library(boost-regex STATIC IMPORTED)
    set_property(TARGET boost-regex PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-regex PROPERTY 
	    IMPORTED_LOCATION_RELEASE ${Boost_REGEX_LIBRARY_RELEASE})
    set_property(TARGET boost-regex PROPERTY 
	    IMPORTED_LOCATION_DEBUG ${Boost_REGEX_LIBRARY_DEBUG})
endif(WIN32)

if(UNIX)
    add_library(boost-datetime INTERFACE IMPORTED)
    set_property(TARGET boost-datetime PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-datetime PROPERTY
            INTERFACE_LINK_LIBRARIES ${Boost_DATETIME_LIBRARY})

    add_library(boost-filesystem INTERFACE IMPORTED)
    set_property(TARGET boost-filesystem PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-filesystem PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_FILESYSTEM_LIBRARY})

    add_library(boost-system INTERFACE IMPORTED)
    set_property(TARGET boost-system PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-system PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_SYSTEM_LIBRARY})

    add_library(boost-chrono INTERFACE IMPORTED)
    set_property(TARGET boost-chrono PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-chrono PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_CHRONO_LIBRARY})

    add_library(boost-iostreams INTERFACE IMPORTED)
    set_property(TARGET boost-iostreams PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-iostreams PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_IOSTREAMS_LIBRARY})

    add_library(boost-serialization INTERFACE IMPORTED)
    set_property(TARGET boost-serialization PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-serialization PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_SERIALIZATION_LIBRARY})

    add_library(boost-thread INTERFACE IMPORTED)
    set_property(TARGET boost-thread PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-thread PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_THREAD_LIBRARY})
	
    add_library(boost-regex INTERFACE IMPORTED)
    set_property(TARGET boost-regex PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
    set_property(TARGET boost-regex PROPERTY 
	    INTERFACE_LINK_LIBRARIES ${Boost_REGEX_LIBRARY})
endif(UNIX)

