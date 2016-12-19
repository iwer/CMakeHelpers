#
# This CMake Module locates the openFrameworks Library,
# enabling FIND_PACKAGE(openFrameworks) to work.
#

SET(openFrameworks_DIR "" CACHE PATH "Root path of openFrameworks")

if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    if (${CMAKE_SIZEOF_VOID_P} EQUAL 8)
        set(PLATFORM "linux64")
    else ()
        set(PLATFORM "linux")
    endif ()
    set(LIB_PREFIX "lib")
    set(LIB_EXTENS "a")
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(PLATFORM "osx")
elseif (${WIN32})
    if (${CMAKE_SIZEOF_VOID_P} EQUAL 8)
        set(PLATFORM "vs/x64")
    else ()
        set(PLATFORM "vs/Win32")
    endif ()
    set(LIB_EXTENS "lib")
endif ()

find_package(OpenGL)

if (${PLATFORM} MATCHES "vs")
    if (NOT TARGET boost-filesystem)
        add_library(boost-filesystem STATIC IMPORTED)
        set_property(TARGET boost-filesystem PROPERTY
                INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/boost/include)
        set_property(TARGET boost-filesystem PROPERTY
                IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/boost/lib/${PLATFORM}/libboost_filesystem-vc140-mt-1_58.${LIB_EXTENS})
        set_property(TARGET boost-filesystem PROPERTY
                IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/boost/lib/${PLATFORM}/libboost_filesystem-vc140-mt-gd-1_58.${LIB_EXTENS})
    endif ()

    if (NOT TARGET boost-system)
        add_library(boost-system STATIC IMPORTED)
        set_property(TARGET boost-system PROPERTY
                INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/boost/include)
        set_property(TARGET boost-system PROPERTY
                IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/boost/lib/${PLATFORM}/libboost_system-vc140-mt-1_58.${LIB_EXTENS})
        set_property(TARGET boost-system PROPERTY
                IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/boost/lib/${PLATFORM}/libboost_system-vc140-mt-gd-1_58.${LIB_EXTENS})
    endif ()

    add_library(libcairo STATIC IMPORTED)
    set_property(TARGET libcairo PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/cairo/include/cairo)
    set_property(TARGET libcairo PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/cairo/lib/${PLATFORM}/cairo-static.${LIB_EXTENS})
    set_property(TARGET libcairo PROPERTY
            INTERFACE_COMPILE_DEFINITIONS CAIRO_WIN32_STATIC_BUILD DISABLE_SOME_FLOATING_POINT)

    add_library(freeimage STATIC IMPORTED)
    set_property(TARGET freeimage PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/FreeImage/include)
    set_property(TARGET freeimage PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/FreeImage/lib/${PLATFORM}/FreeImage.${LIB_EXTENS})
    #set_property(TARGET freeimage PROPERTY
    #	INTERFACE_LINK_LIBRARIES ${openFrameworks_DIR}/export/${PLATFORM}/FreeImage.dll)

    add_library(freetype STATIC IMPORTED)
    set_property(TARGET freetype PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/freetype/include/freetype2)
    set_property(TARGET freetype PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/freetype/lib/${PLATFORM}/libfreetype.${LIB_EXTENS})
    #set_property(TARGET freetype PROPERTY
    #	INTERFACE_LINK_LIBRARIES ${openFrameworks_DIR}/export/${PLATFORM}/freetype.dll)

    add_library(glew STATIC IMPORTED)
    set_property(TARGET glew PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glew/include)
    set_property(TARGET glew PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/glew/lib/${PLATFORM}/glew32s.${LIB_EXTENS})

    add_library(glu STATIC IMPORTED)
    set_property(TARGET glu PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glu/include)
    set_property(TARGET glu PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/glu/lib/${PLATFORM}/glu32.${LIB_EXTENS})

    add_library(glut STATIC IMPORTED)
    set_property(TARGET glut PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glut/include)
    set_property(TARGET glut PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/glut/lib/${PLATFORM}/glut32.${LIB_EXTENS})

    add_library(openssl STATIC IMPORTED)
    set_property(TARGET openssl PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/openssl/include)
    set_property(TARGET openssl PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/openssl/lib/${PLATFORM}/ssleay32md.${LIB_EXTENS})
    add_library(eay STATIC IMPORTED)
    set_property(TARGET eay PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/openssl/include)
    set_property(TARGET eay PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/openssl/lib/${PLATFORM}/libeay32md.${LIB_EXTENS})

    add_library(rtaudio STATIC IMPORTED)
    set_property(TARGET rtaudio PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/rtAudio/include)
    set_property(TARGET rtaudio PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/rtAudio/lib/${PLATFORM}/rtAudio.${LIB_EXTENS})
    set_property(TARGET rtaudio PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/rtAudio/lib/${PLATFORM}/rtAudioD.${LIB_EXTENS})

    add_library(png STATIC IMPORTED)
    set_property(TARGET png PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/cairo/include/cairo)
    set_property(TARGET png PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/cairo/lib/${PLATFORM}/libpng.${LIB_EXTENS})

    add_library(pixman STATIC IMPORTED)
    set_property(TARGET pixman PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/cairo/include/cairo)
    set_property(TARGET pixman PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/cairo/lib/${PLATFORM}/pixman-1.${LIB_EXTENS})

    add_library(fmodex STATIC IMPORTED)
    set_property(TARGET fmodex PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/fmodex/include)
    set_property(TARGET fmodex PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/fmodex/lib/${PLATFORM}/fmodex_vc.${LIB_EXTENS})
    set_property(TARGET fmodex PROPERTY
            INTERFACE_LINK_LIBRARIES_RELEASE ${openFrameworks_DIR}/export/${PLATFORM}/fmodex.dll)
    set_property(TARGET fmodex PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/fmodex/lib/${PLATFORM}/fmodexL_vc.${LIB_EXTENS})
    set_property(TARGET fmodex PROPERTY
            INTERFACE_LINK_LIBRARIES_DEBUG ${openFrameworks_DIR}/export/${PLATFORM}/fmodexL.dll)

    add_library(pococrypto STATIC IMPORTED)
    set_property(TARGET pococrypto PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pococrypto PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoCryptomd.${LIB_EXTENS})
    set_property(TARGET pococrypto PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoCryptomdd.${LIB_EXTENS})
    set_property(TARGET pococrypto PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocodata STATIC IMPORTED)
    set_property(TARGET pocodata PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocodata PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoDatamd.${LIB_EXTENS})
    set_property(TARGET pocodata PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoDatamdd.${LIB_EXTENS})
    set_property(TARGET pocodata PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocodatasql STATIC IMPORTED)
    set_property(TARGET pocodatasql PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocodatasql PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoDataSQLitemd.${LIB_EXTENS})
    set_property(TARGET pocodatasql PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoDataSQLitemdd.${LIB_EXTENS})
    set_property(TARGET pocodatasql PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocofoundation STATIC IMPORTED)
    set_property(TARGET pocofoundation PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocofoundation PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoFoundationmd.${LIB_EXTENS})
    set_property(TARGET pocofoundation PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoFoundationmdd.${LIB_EXTENS})
    set_property(TARGET pocofoundation PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocojson STATIC IMPORTED)
    set_property(TARGET pocojson PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocojson PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoJSONmd.${LIB_EXTENS})
    set_property(TARGET pocojson PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoJSONmdd.${LIB_EXTENS})
    set_property(TARGET pocojson PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocomongodb STATIC IMPORTED)
    set_property(TARGET pocomongodb PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocomongodb PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoMongoDBmd.${LIB_EXTENS})
    set_property(TARGET pocomongodb PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoMongoDBmdd.${LIB_EXTENS})
    set_property(TARGET pocomongodb PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(poconet STATIC IMPORTED)
    set_property(TARGET poconet PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET poconet PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoNetmd.${LIB_EXTENS})
    set_property(TARGET poconet PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoNetmdd.${LIB_EXTENS})
    set_property(TARGET poconet PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(poconetssl STATIC IMPORTED)
    set_property(TARGET poconetssl PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET poconetssl PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoNetSSLmd.${LIB_EXTENS})
    set_property(TARGET poconetssl PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoNetSSLmdd.${LIB_EXTENS})
    set_property(TARGET poconetssl PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocopdf STATIC IMPORTED)
    set_property(TARGET pocopdf PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocopdf PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoPDFmd.${LIB_EXTENS})
    set_property(TARGET pocopdf PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoPDFmdd.${LIB_EXTENS})
    set_property(TARGET pocopdf PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocoutil STATIC IMPORTED)
    set_property(TARGET pocoutil PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocoutil PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoUtilmd.${LIB_EXTENS})
    set_property(TARGET pocoutil PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoUtilmdd.${LIB_EXTENS})
    set_property(TARGET pocoutil PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocoxml STATIC IMPORTED)
    set_property(TARGET pocoxml PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocoxml PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoXMLmd.${LIB_EXTENS})
    set_property(TARGET pocoxml PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoXMLmdd.${LIB_EXTENS})
    set_property(TARGET pocoxml PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocozip STATIC IMPORTED)
    set_property(TARGET pocozip PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocozip PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoZipmd.${LIB_EXTENS})
    set_property(TARGET pocozip PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/PocoZipmdd.${LIB_EXTENS})
    set_property(TARGET pocozip PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

endif (${PLATFORM} MATCHES "vs")

if (${PLATFORM} MATCHES "linux")
    find_package(Boost REQUIRED)

    if (NOT TARGET boost-filesystem)
        add_library(boost-filesystem INTERFACE IMPORTED)
        set_property(TARGET boost-filesystem PROPERTY
                INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIR})
        set_property(TARGET boost-filesystem PROPERTY
                IMPORTED_LOCATION_RELEASE ${Boost_FILESYSTEM_LIBRARY_RELEASE})
        set_property(TARGET boost-filesystem PROPERTY
                IMPORTED_LOCATION_DEBUG ${Boost_FILESYSTEM_LIBRARY_DEBUG})
    endif ()

    if (NOT TARGET boost-system)
        add_library(boost-system INTERFACE IMPORTED)
        set_property(TARGET boost-system PROPERTY
                INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIR})
        set_property(TARGET boost-system PROPERTY
                IMPORTED_LOCATION_RELEASE ${Boost_SYSTEM_LIBRARY_RELEASE})
        set_property(TARGET boost-system PROPERTY
                IMPORTED_LOCATION_DEBUG ${Boost_SYSTEM_LIBRARY_DEBUG})
    endif ()

    include(FindPkgConfig)

    pkg_search_module(Cairo REQUIRED cairo)
    message(STATUS "Found cairo: ${Cairo_INCLUDE_DIRS} ${Cairo_LIBRARIES}")
    add_library(libcairo INTERFACE IMPORTED)
    set_property(TARGET libcairo PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${Cairo_INCLUDE_DIRS})
    set_property(TARGET libcairo PROPERTY
            INTERFACE_LINK_LIBRARIES ${Cairo_LIBRARIES})

    pkg_search_module(ZLIB REQUIRED zlib)
    message(STATUS "Found zlib: ${ZLIB_INCLUDE_DIRS} ${ZLIB_LIBRARIES}")
    add_library(zlib INTERFACE IMPORTED)
    set_property(TARGET zlib PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${ZLIB_INCLUDE_DIRS})
    set_property(TARGET zlib PROPERTY
            INTERFACE_LINK_LIBRARIES ${ZLIB_LIBRARIES})

    pkg_search_module(GST REQUIRED gstreamer-1.0)
    pkg_search_module(GSTAPP REQUIRED gstreamer-app-1.0)
    pkg_search_module(GSTVID REQUIRED gstreamer-video-1.0)
    pkg_search_module(GSTBASE REQUIRED gstreamer-base-1.0)
    message(STATUS "Found gstreamer: ${GST_INCLUDE_DIRS} ${GST_LIBRARIES}")
    add_library(gstreamer INTERFACE IMPORTED)
    set_property(TARGET gstreamer PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${GST_INCLUDE_DIRS} ${GSTAPP_INCLUDE_DIRS} ${GSTVID_INCLUDE_DIRS} ${GSTBASE_INCLUDE_DIRS})
    set_property(TARGET gstreamer PROPERTY
            INTERFACE_LINK_LIBRARIES ${GST_LIBRARIES} ${GSTAPP_LIBRARIES} ${GSTVID_LIBRARIES} ${GSTBASE_LIBRARIES})

    pkg_search_module(UDEV REQUIRED libudev)
    message(STATUS "Found libudev: ${UDEV_INCLUDE_DIRS} ${UDEV_LIBRARIES}")
    add_library(libudev INTERFACE IMPORTED)
    set_property(TARGET libudev PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${UDEV_INCLUDE_DIRS})
    set_property(TARGET zlib PROPERTY
            INTERFACE_LINK_LIBRARIES ${UDEV_LIBRARIES})

    pkg_search_module(FreeType2 REQUIRED freetype2)
    message(STATUS "Found freetype2: ${FreeType2_INCLUDE_DIRS} ${FreeType2_LIBRARIES}")
    add_library(freetype2 INTERFACE IMPORTED)
    set_property(TARGET freetype2 PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${FreeType2_INCLUDE_DIRS})
    set_property(TARGET freetype2 PROPERTY
            INTERFACE_LINK_LIBRARIES ${FreeType2_LIBRARIES})

    pkg_search_module(FontConfig REQUIRED fontconfig)
    message(STATUS "Found fontconfig: ${FontConfig_INCLUDE_DIRS} ${FontConfig_LIBRARIES}")
    add_library(libfontconfig INTERFACE IMPORTED)
    set_property(TARGET libfontconfig PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${FontConfig_INCLUDE_DIRS})
    set_property(TARGET libfontconfig PROPERTY
            INTERFACE_LINK_LIBRARIES ${FontConfig_LIBRARIES})

    pkg_search_module(Sndfile REQUIRED sndfile)
    message(STATUS "Found sndfile: ${Sndfile_INCLUDE_DIRS} ${Sndfile_LIBRARIES}")
    add_library(libsndfile INTERFACE IMPORTED)
    set_property(TARGET libsndfile PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${Sndfile_INCLUDE_DIRS})
    set_property(TARGET libsndfile PROPERTY
            INTERFACE_LINK_LIBRARIES ${Sndfile_LIBRARIES})

    pkg_search_module(OpenAL REQUIRED openal)
    message(STATUS "Found openal: ${OpenAL_INCLUDE_DIRS} ${OpenAL_LIBRARIES}")
    add_library(openAL INTERFACE IMPORTED)
    set_property(TARGET openAL PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${OpenAL_INCLUDE_DIRS})
    set_property(TARGET openAL PROPERTY
            INTERFACE_LINK_LIBRARIES ${OpenAL_LIBRARIES})

    pkg_search_module(OSSL REQUIRED openssl)
    message(STATUS "Found openssl: ${OSSL_INCLUDE_DIRS} ${OSSL_LIBRARIES}")
    add_library(openssl INTERFACE IMPORTED)
    set_property(TARGET openssl PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${OSSL_INCLUDE_DIRS})
    set_property(TARGET openssl PROPERTY
            INTERFACE_LINK_LIBRARIES ${OSSL_LIBRARIES})

    # glfw3 only works with included version
    #pkg_search_module(GLFW3 REQUIRED glfw3)
    #message(STATUS "Found glfw3: ${GLFW3_INCLUDE_DIRS} ${GLFW3_LIBRARIES}")
    #add_library(glfw3 INTERFACE IMPORTED)
    #set_property(TARGET glfw3 PROPERTY
    #        INTERFACE_INCLUDE_DIRECTORIES ${GLFW3_INCLUDE_DIRS})
    #set_property(TARGET glfw3 PROPERTY
    #        INTERFACE_LINK_LIBRARIES ${GLFW3_LIBRARIES})

    pkg_search_module(RtAudio REQUIRED rtaudio)
    message(STATUS "Found rtaudio: ${RtAudio_INCLUDE_DIRS} ${RtAudio_LIBRARIES} ${RtAudio_DEFINITIONS}")
    add_library(rtaudio INTERFACE IMPORTED)
    set_property(TARGET rtaudio PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${RtAudio_INCLUDE_DIRS})
    set_property(TARGET rtaudio PROPERTY
            INTERFACE_LINK_LIBRARIES ${RtAudio_LIBRARIES})
    set_property(TARGET rtaudio PROPERTY
            INTERFACE_COMPILE_DEFINITIONS ${RtAudio_DEFINITIONS})

    pkg_search_module(GL REQUIRED gl)
    message(STATUS "Found gl: ${GL_INCLUDE_DIRS} ${GL_LIBRARIES}")
    add_library(gl SHARED IMPORTED)
    set_property(TARGET gl PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${GL_INCLUDE_DIRS})
    set_property(TARGET gl PROPERTY
            INTERFACE_LINK_LIBRARIES ${GL_LIBRARIES})

    pkg_search_module(GLU REQUIRED glu)
    message(STATUS "Found glu: ${GLU_INCLUDE_DIRS} ${GLU_LIBRARIES}")
    add_library(glu INTERFACE IMPORTED)
    set_property(TARGET glu PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${GLU_INCLUDE_DIRS})
    set_property(TARGET glu PROPERTY
            INTERFACE_LINK_LIBRARIES ${GLU_LIBRARIES})

    pkg_search_module(GLEW REQUIRED glew)
    message(STATUS "Found glew: ${GLEW_INCLUDE_DIRS} ${GLEW_LIBRARIES}")
    add_library(glew INTERFACE IMPORTED)
    set_property(TARGET glew PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${GLEW_INCLUDE_DIRS})
    set_property(TARGET glew PROPERTY
            INTERFACE_LINK_LIBRARIES ${GLEW_LIBRARIES})

    pkg_search_module(GTK REQUIRED gtk+-3.0)
    message(STATUS "Found gtk+-3.0: ${GTK_INCLUDE_DIRS} ${GTK_LIBRARIES}")
    add_library(gtk INTERFACE IMPORTED)
    set_property(TARGET gtk PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${GTK_INCLUDE_DIRS})
    set_property(TARGET gtk PROPERTY
            INTERFACE_LINK_LIBRARIES ${GTK_LIBRARIES})

    add_library(fmodex INTERFACE IMPORTED)
    set_property(TARGET fmodex PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/fmodex/include)
    set_property(TARGET fmodex PROPERTY
            INTERFACE_LINK_LIBRARIES ${openFrameworks_DIR}/libs/fmodex/lib/${PLATFORM}/${LIB_PREFIX}fmodex.so)
    #set_property(TARGET fmodex PROPERTY
    #        INTERFACE_LINK_LIBRARIES ${openFrameworks_DIR}/export/${PLATFORM}/${LIB_PREFIX}fmodex.so)
    
    add_library(pococrypto STATIC IMPORTED)
    set_property(TARGET pococrypto PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pococrypto PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoCrypto.${LIB_EXTENS})
    set_property(TARGET pococrypto PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocodata STATIC IMPORTED)
    set_property(TARGET pocodata PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocodata PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoData.${LIB_EXTENS})
    set_property(TARGET pocodata PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocodatasql STATIC IMPORTED)
    set_property(TARGET pocodatasql PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocodatasql PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoDataSQLite.${LIB_EXTENS})
    set_property(TARGET pocodatasql PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocofoundation STATIC IMPORTED)
    set_property(TARGET pocofoundation PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocofoundation PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoFoundation.${LIB_EXTENS})
    set_property(TARGET pocofoundation PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocojson STATIC IMPORTED)
    set_property(TARGET pocojson PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocojson PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoJSON.${LIB_EXTENS})
    set_property(TARGET pocojson PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocomongodb STATIC IMPORTED)
    set_property(TARGET pocomongodb PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocomongodb PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoMongoDB.${LIB_EXTENS})
    set_property(TARGET pocomongodb PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(poconet STATIC IMPORTED)
    set_property(TARGET poconet PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET poconet PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoNet.${LIB_EXTENS})
    set_property(TARGET poconet PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(poconetssl STATIC IMPORTED)
    set_property(TARGET poconetssl PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET poconetssl PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoNetSSL.${LIB_EXTENS})
    set_property(TARGET poconetssl PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

#    add_library(pocopdf STATIC IMPORTED)
#    set_property(TARGET pocopdf PROPERTY
#            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
#    set_property(TARGET pocopdf PROPERTY
#            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoPDF.${LIB_EXTENS})
#    set_property(TARGET pocopdf PROPERTY
#            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocoutil STATIC IMPORTED)
    set_property(TARGET pocoutil PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocoutil PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoUtil.${LIB_EXTENS})
    set_property(TARGET pocoutil PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocoxml STATIC IMPORTED)
    set_property(TARGET pocoxml PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocoxml PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoXML.${LIB_EXTENS})
    set_property(TARGET pocoxml PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(pocozip STATIC IMPORTED)
    set_property(TARGET pocozip PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
    set_property(TARGET pocozip PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/poco/lib/${PLATFORM}/${LIB_PREFIX}PocoZip.${LIB_EXTENS})
    set_property(TARGET pocozip PROPERTY
            INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

    add_library(kiss STATIC IMPORTED)
    set_property(TARGET kiss PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/kiss/include)
    set_property(TARGET kiss PROPERTY
            IMPORTED_LOCATION ${openFrameworks_DIR}/libs/kiss/lib/${PLATFORM}/${LIB_PREFIX}kiss.${LIB_EXTENS})
endif (${PLATFORM} MATCHES "linux")

add_library(glfw STATIC IMPORTED)
set_property(TARGET glfw PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glfw/include)
set_property(TARGET glfw PROPERTY
        IMPORTED_LOCATION ${openFrameworks_DIR}/libs/glfw/lib/${PLATFORM}/${LIB_PREFIX}glfw3.${LIB_EXTENS})

add_library(tess STATIC IMPORTED)
set_property(TARGET tess PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/tess2/include)
set_property(TARGET tess PROPERTY
        IMPORTED_LOCATION ${openFrameworks_DIR}/libs/tess2/lib/${PLATFORM}/${LIB_PREFIX}tess2.${LIB_EXTENS})

add_library(utf8 INTERFACE IMPORTED)
set_property(TARGET utf8 PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/utf8cpp/include)
set_property(TARGET utf8 PROPERTY INTERFACE_COMPILE_DEFINITIONS
        UNICODE
        _UNICODE
        )


add_library(videoinput STATIC IMPORTED)
set_property(TARGET videoinput PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/videoInput/include)
set_property(TARGET videoinput PROPERTY
        IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/videoInput/lib/${PLATFORM}/${LIB_PREFIX}videoInput.${LIB_EXTENS})
set_property(TARGET videoinput PROPERTY
        IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/videoInput/lib/${PLATFORM}/${LIB_PREFIX}videoInputD.${LIB_EXTENS})


#add_library(json INTERFACE IMPORTED)
#set_property(TARGET json PROPERTY
#	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/json/include)

if (${PLATFORM} MATCHES "vs")
    set(platform_spec_SRCS
            ${openFrameworks_DIR}/libs/openFrameworks/video/ofDirectShowGrabber.cpp
            ${openFrameworks_DIR}/libs/openFrameworks/video/ofDirectShowPlayer.cpp
        	${openFrameworks_DIR}/libs/openFrameworks/video/ofQtUtils.cpp
        	${openFrameworks_DIR}/libs/openFrameworks/video/ofQuickTimeGrabber.cpp
        	${openFrameworks_DIR}/libs/openFrameworks/video/ofQuickTimePlayer.cpp
            )
endif (${PLATFORM} MATCHES "vs")

SET(openFrameworks_SRCS
        ${openFrameworks_DIR}/libs/openFrameworks/3d/of3dPrimitives.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/of3dUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofCamera.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofEasyCam.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofMesh.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/3d/ofNode.cpp
        #	${openFrameworks_DIR}/libs/openFrameworks/app/ofAppEGLWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppGLFWWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppGlutWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppNoWindow.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofAppRunner.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/app/ofMainLoop.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/communication/ofArduino.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/communication/ofSerial.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/events/ofEvents.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofBufferObject.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofFbo.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofGLProgrammableRenderer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofGLRenderer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofGLUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofLight.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofMaterial.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofShader.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofTexture.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofVbo.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/gl/ofVboMesh.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/of3dGraphics.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofBitmapFont.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofCairoRenderer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofGraphics.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofImage.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofPath.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofPixels.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofPolyline.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofRendererCollection.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofTessellator.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/graphics/ofTrueTypeFont.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofMath.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofMatrix3x3.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofMatrix4x4.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofQuaternion.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofVec2f.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/math/ofVec4f.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofBaseSoundStream.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofFmodSoundPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofOpenALSoundPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofRtAudioSoundStream.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundBuffer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/sound/ofSoundStream.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofBaseTypes.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofColor.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofParameter.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofParameterGroup.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/types/ofRectangle.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofFileUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofFpsCounter.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofLog.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofMatrixStack.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofSystemUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofThread.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofTimer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofURLFileLoader.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/utils/ofXml.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofGstUtils.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofGstVideoGrabber.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofGstVideoPlayer.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofVideoGrabber.cpp
        ${openFrameworks_DIR}/libs/openFrameworks/video/ofVideoPlayer.cpp
        ${platform_spec_SRCS}
        )

SET(openFrameworks_INCLUDE_DIRS
        ${openFrameworks_DIR}/libs/openFrameworks
        ${openFrameworks_DIR}/libs/openFrameworks/graphics
        ${openFrameworks_DIR}/libs/openFrameworks/3d
        ${openFrameworks_DIR}/libs/openFrameworks/math
        ${openFrameworks_DIR}/libs/openFrameworks/gl
        ${openFrameworks_DIR}/libs/openFrameworks/video
        ${openFrameworks_DIR}/libs/openFrameworks/types
        ${openFrameworks_DIR}/libs/openFrameworks/sound
        ${openFrameworks_DIR}/libs/openFrameworks/app
        ${openFrameworks_DIR}/libs/openFrameworks/events
        ${openFrameworks_DIR}/libs/openFrameworks/communication
        ${openFrameworks_DIR}/libs/openFrameworks/utils)

add_library(openFrameworks ${openFrameworks_SRCS})

target_include_directories(openFrameworks PUBLIC
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/graphics>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/3d>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/math>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/gl>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/video>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/types>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/sound>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/app>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/events>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/communication>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/libs/openFrameworks/utils>
        $<INSTALL_INTERFACE:include>
        PRIVATE src)


if (${PLATFORM} MATCHES "vs")
    set_property(TARGET openFrameworks PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/${PLATFORM}/openframeworksLib.${LIB_EXTENS})
    set_property(TARGET openFrameworks PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/${PLATFORM}/openframeworksLib_debug.${LIB_EXTENS})
    set_property(TARGET openFrameworks PROPERTY
            INTERFACE_COMPILE_DEFINITIONS
            _CONSOLE
            WIN32
            $<$<CONFIG:Release>:NDEBUG>
            $<$<CONFIG:Debug>:_DEBUG>
            )
endif (${PLATFORM} MATCHES "vs")

if (${PLATFORM} MATCHES "linux")
    set_property(TARGET openFrameworks PROPERTY
            IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/${PLATFORM}/${LIB_PREFIX}openFrameworks.${LIB_EXTENS})
    set_property(TARGET openFrameworks PROPERTY
            IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/${PLATFORM}/${LIB_PREFIX}openFrameworksDebug.${LIB_EXTENS})
    set_property(TARGET openFrameworks PROPERTY
            INTERFACE_COMPILE_DEFINITIONS
            _CONSOLE
            $<$<CONFIG:Release>:NDEBUG>
            $<$<CONFIG:Debug>:_DEBUG>
            )
endif (${PLATFORM} MATCHES "linux")

target_compile_features(openFrameworks PUBLIC
        cxx_auto_type
        cxx_unicode_literals)

if (${PLATFORM} MATCHES "vs")
    set(platform_libs
        	png
        	pixman
            freetype
            winmm
            Crypt32
            ws2_32
            pocopdf
            eay
            )
endif (${PLATFORM} MATCHES "vs")

if (${PLATFORM} MATCHES "linux")
    set(platform_libs
            glut
            glfw
            X11            
            Xrandr
            Xxf86vm
            Xi
            Xcursor
            dl
            pthread
            freeimage
            boost-system
            boost-filesystem
            poconetssl
            poconet
            pococrypto
            #pocomongodb
            #pocodatasql
            #pocodata
            pocoutil
            pocojson
            pocoxml
            #pocozip
            pocofoundation
            fmodex
            tess
            utf8
            libcairo
            zlib
            gstreamer
            libudev
            libfontconfig
            #freetype2
            libsndfile
            openAL
            openssl
            Xinerama
            rtaudio
            ${OPENGL_gl_LIBRARY}
            glu
            glew
            gtk
            mpg123
            kiss            
            )
endif (${PLATFORM} MATCHES "linux")

target_link_libraries(openFrameworks
        
        #
        #	videoinput

        #	json
        ${platform_libs}
        )




if (${PLATFORM} MATCHES "vs")
    set(openFrameworks_SHARED_LIBS
            ${openFrameworks_DIR}/export/${PLATFORM}/assimp.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/fmodex.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/fmodexL.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/FreeImage.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/freetype.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/glut32.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/libeay32.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/ssleay32.dll
            ${openFrameworks_DIR}/export/${PLATFORM}/Zlib.dll
            )
    file(COPY ${openFrameworks_SHARED_LIBS} DESTINATION ${EXECUTABLE_OUTPUT_PATH}/Release)
    file(COPY ${openFrameworks_SHARED_LIBS} DESTINATION ${EXECUTABLE_OUTPUT_PATH}/Debug)
endif (${PLATFORM} MATCHES "vs")
if (${PLATFORM} MATCHES "linux")
    set(openFrameworks_SHARED_LIBS
            ${openFrameworks_DIR}/export/${PLATFORM}/libs/libfmodex.so
            )
    #file(COPY ${openFrameworks_SHARED_LIBS} DESTINATION ${EXECUTABLE_OUTPUT_PATH}/bin/libs)
endif (${PLATFORM} MATCHES "linux")

export(TARGETS openFrameworks FILE openFrameworksConfig.cmake)

#FIND_PATH(openFrameworks_INCLUDE_DIR NAMES ofMain.h
#        HINTS ${openFrameworks_DIR}/libs/openFrameworks)
#MARK_AS_ADVANCED(openFrameworks_INCLUDE_DIR)
#
#FIND_LIBRARY(openFrameworks_LIBRARY NAMES openFrameworksLib
#        HINTS ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/${PLATFORM})
#MARK_AS_ADVANCED(openFrameworks_LIBRARY)
#
#FIND_LIBRARY(openFrameworks_LIBRARY_DEBUG NAMES openFrameworksLib_debug
#        HINTS ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/${PLATFORM})
#MARK_AS_ADVANCED(openFrameworks_LIBRARY_DEBUG)
#
#
#IF (${PLATFORM} MATCHES "vs")
#    set(openFrameworks_DEFINITIONS
#            "-DWIN32"
#            "-DNDEBUG"
#            "-D_CONSOLE"
#            "-DDISABLE_SOME_FLOATING_POINT"
#            )
#    set(openFrameworks_DEFINITIONS_DEBUG
#            "-DWIN32"
#            "-D_DEBUG"
#            "-D_CONSOLE"
#            "-DDISABLE_SOME_FLOATING_POINT"
#            )
#ENDIF (${PLATFORM} MATCHES "vs")




