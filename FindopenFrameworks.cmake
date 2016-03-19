#
# This CMake Module locates the openFrameworks Library,
# enabling FIND_PACKAGE(openFrameworks) to work.
#

SET(openFrameworks_DIR "" CACHE PATH "Root path of openFrameworks")

if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
        set(PLATFORM "linux64")
    else()
        set(PLATFORM "linux")
    endif()
    set(LIB_PREFIX "lib")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(PLATFORM "osx")
elseif(${WIN32})
    set(PLATFORM "vs")
endif()

find_package(OpenGL)

add_library(boost-filesystem STATIC IMPORTED)
set_property(TARGET boost-filesystem PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/boost/include)
set_property(TARGET boost-filesystem PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/boost/lib/vs/Win32/libboost_filesystem-vc140-mt-1_58.lib)
set_property(TARGET boost-filesystem PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/boost/lib/vs/Win32/libboost_filesystem-vc140-mt-gd-1_58.lib)
	
add_library(boost-system STATIC IMPORTED)
set_property(TARGET boost-system PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/boost/include)
set_property(TARGET boost-system PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/boost/lib/vs/Win32/libboost_system-vc140-mt-1_58.lib)
set_property(TARGET boost-system PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/boost/lib/vs/Win32/libboost_system-vc140-mt-gd-1_58.lib)

	
add_library(cairo STATIC IMPORTED)
set_property(TARGET cairo PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/cairo/include/cairo)
set_property(TARGET cairo PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/cairo/lib/vs/Win32/cairo-static.lib)
set_property(TARGET cairo PROPERTY
	INTERFACE_COMPILE_DEFINITIONS CAIRO_WIN32_STATIC_BUILD DISABLE_SOME_FLOATING_POINT)
	
add_library(png STATIC IMPORTED)
set_property(TARGET png PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/cairo/include/cairo)
set_property(TARGET png PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/cairo/lib/vs/Win32/libpng.lib)

add_library(pixman STATIC IMPORTED)
set_property(TARGET pixman PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/cairo/include/cairo)
set_property(TARGET pixman PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/cairo/lib/vs/Win32/pixman-1.lib)

	
add_library(fmodex STATIC IMPORTED)
set_property(TARGET fmodex PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/fmodex/include)
set_property(TARGET fmodex PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/fmodex/lib/vs/Win32/fmodex_vc.lib)
set_property(TARGET fmodex PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/fmodex/lib/vs/Win32/fmodexL_vc.lib)

	
add_library(freeimage STATIC IMPORTED)
set_property(TARGET freeimage PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/FreeImage/include)
set_property(TARGET freeimage PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/FreeImage/lib/vs/Win32/FreeImage.lib)

	
add_library(freetype STATIC IMPORTED)
set_property(TARGET freetype PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/freetype/include/freetype2)
set_property(TARGET freetype PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/freetype/lib/vs/Win32/libfreetype.lib)

	
add_library(glew STATIC IMPORTED)
set_property(TARGET glew PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glew/include)
set_property(TARGET glew PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/glew/lib/vs/Win32/glew32s.lib)

add_library(glfw STATIC IMPORTED)
set_property(TARGET glfw PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glfw/include)
set_property(TARGET glfw PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/glfw/lib/vs/Win32/glfw3.lib)

add_library(glu STATIC IMPORTED)
set_property(TARGET glu PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glu/include)
set_property(TARGET glu PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/glu/lib/vs/Win32/glu32.lib)

add_library(glut STATIC IMPORTED)
set_property(TARGET glut PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/glut/include)
set_property(TARGET glut PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/glut/lib/vs/Win32/glut32.lib)

	
add_library(openssl STATIC IMPORTED)
set_property(TARGET openssl PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/openssl/include)
set_property(TARGET openssl PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/openssl/lib/vs/Win32/ssleay32md.lib)

add_library(eay STATIC IMPORTED)
set_property(TARGET eay PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/openssl/include)
set_property(TARGET eay PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/openssl/lib/vs/Win32/libeay32md.lib)

	
add_library(pococrypto STATIC IMPORTED)
set_property(TARGET pococrypto PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pococrypto PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoCryptomd.lib)
set_property(TARGET pococrypto PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoCryptomdd.lib)
set_property(TARGET pococrypto PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocodata STATIC IMPORTED)
set_property(TARGET pocodata PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocodata PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoDatamd.lib)
set_property(TARGET pocodata PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoDatamdd.lib)
set_property(TARGET pocodata PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")
	
add_library(pocodatasql STATIC IMPORTED)
set_property(TARGET pocodatasql PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocodatasql PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoDataSQLitemd.lib)
set_property(TARGET pocodatasql PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoDataSQLitemdd.lib)
set_property(TARGET pocodatasql PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocofoundation STATIC IMPORTED)
set_property(TARGET pocofoundation PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocofoundation PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoFoundationmd.lib)
set_property(TARGET pocofoundation PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoFoundationmdd.lib)
set_property(TARGET pocofoundation PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocojson STATIC IMPORTED)
set_property(TARGET pocojson PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocojson PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoJSONmd.lib)
set_property(TARGET pocojson PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoJSONmdd.lib)
set_property(TARGET pocojson PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocomongodb STATIC IMPORTED)
set_property(TARGET pocomongodb PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocomongodb PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoMongoDBmd.lib)
set_property(TARGET pocomongodb PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoMongoDBmdd.lib)
set_property(TARGET pocomongodb PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(poconet STATIC IMPORTED)
set_property(TARGET poconet PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET poconet PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoNetmd.lib)
set_property(TARGET poconet PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoNetmdd.lib)
set_property(TARGET poconet PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(poconetssl STATIC IMPORTED)
set_property(TARGET poconetssl PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET poconetssl PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoNetSSLmd.lib)
set_property(TARGET poconetssl PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoNetSSLmdd.lib)
set_property(TARGET poconetssl PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocopdf STATIC IMPORTED)
set_property(TARGET pocopdf PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocopdf PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoPDFmd.lib)
set_property(TARGET pocopdf PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoPDFmdd.lib)
set_property(TARGET pocopdf PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocoutil STATIC IMPORTED)
set_property(TARGET pocoutil PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocoutil PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoUtilmd.lib)
set_property(TARGET pocoutil PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoUtilmdd.lib)
set_property(TARGET pocoutil PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocoxml STATIC IMPORTED)
set_property(TARGET pocoxml PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocoxml PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoXMLmd.lib)
set_property(TARGET pocoxml PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoXMLmdd.lib)
set_property(TARGET pocoxml PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(pocozip STATIC IMPORTED)
set_property(TARGET pocozip PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/poco/include)
set_property(TARGET pocozip PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoZipmd.lib)
set_property(TARGET pocozip PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/poco/lib/vs/Win32/PocoZipmdd.lib)
set_property(TARGET pocozip PROPERTY
	INTERFACE_COMPILE_DEFINITIONS "POCO_STATIC")

add_library(rtaudio STATIC IMPORTED)
set_property(TARGET rtaudio PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/rtAudio/include)
set_property(TARGET rtaudio PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/rtAudio/lib/vs/Win32/rtAudio.lib)
set_property(TARGET rtaudio PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/rtAudio/lib/vs/Win32/rtAudioD.lib)

add_library(tess STATIC IMPORTED)
set_property(TARGET tess PROPERTY
	INTERFACE_INCLUDE_DIRECTORIES ${openFrameworks_DIR}/libs/tess2/include)
set_property(TARGET tess PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/tess2/lib/vs/Win32/tess2.lib)

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
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/videoInput/lib/vs/Win32/videoInput.lib)
set_property(TARGET videoinput PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/videoInput/lib/vs/Win32/videoInputD.lib)

	
SET (openFrameworks_SRCS 
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
	${openFrameworks_DIR}/libs/openFrameworks/video/ofDirectShowGrabber.cpp
	${openFrameworks_DIR}/libs/openFrameworks/video/ofDirectShowPlayer.cpp
#	${openFrameworks_DIR}/libs/openFrameworks/video/ofGstUtils.cpp
#	${openFrameworks_DIR}/libs/openFrameworks/video/ofGstVideoGrabber.cpp
#	${openFrameworks_DIR}/libs/openFrameworks/video/ofGstVideoPlayer.cpp
#	${openFrameworks_DIR}/libs/openFrameworks/video/ofQtUtils.cpp
#	${openFrameworks_DIR}/libs/openFrameworks/video/ofQuickTimeGrabber.cpp
#	${openFrameworks_DIR}/libs/openFrameworks/video/ofQuickTimePlayer.cpp
	${openFrameworks_DIR}/libs/openFrameworks/video/ofVideoGrabber.cpp
	${openFrameworks_DIR}/libs/openFrameworks/video/ofVideoPlayer.cpp
)
SET (openFrameworks_INCLUDE_DIRS
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
	
set_property(TARGET openFrameworks PROPERTY
	IMPORTED_LOCATION_RELEASE ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/vs/Win32/openframeworksLib.lib)
set_property(TARGET openFrameworks PROPERTY
	IMPORTED_LOCATION_DEBUG ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/vs/Win32/openframeworksLib_debug.lib)
set_property(TARGET openFrameworks PROPERTY
	INTERFACE_COMPILE_DEFINITIONS 
		_CONSOLE
        WIN32 
        $<$<CONFIG:Release>:NDEBUG>
        $<$<CONFIG:Debug>:_DEBUG>
)
	
target_compile_features(openFrameworks PUBLIC 
	cxx_auto_type
	cxx_unicode_literals)	

	
target_link_libraries(openFrameworks
    boost-filesystem 
	boost-system 
	cairo 
	png 
	pixman 
	fmodex 
	freeimage 
	freetype 
	${OPENGL_gl_LIBRARY}
	glew 
	glfw 
	glu 
	glut 
	openssl 
	eay 
	pococrypto 
	pocodata 
	pocodatasql
	pocofoundation
	pocojson
	pocomongodb
	poconet
	poconetssl
	pocopdf
	pocoutil
	pocoxml
	pocozip
	rtaudio
	tess
	utf8
	videoinput
	winmm)

FIND_PATH(openFrameworks_INCLUDE_DIR NAMES ofMain.h
        HINTS ${openFrameworks_DIR}/libs/openFrameworks)
MARK_AS_ADVANCED(openFrameworks_INCLUDE_DIR)

FIND_LIBRARY(openFrameworks_LIBRARY NAMES openFrameworksLib
        HINTS ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/vs/Win32)
MARK_AS_ADVANCED(openFrameworks_LIBRARY)

FIND_LIBRARY(openFrameworks_LIBRARY_DEBUG NAMES openFrameworksLib_debug
        HINTS ${openFrameworks_DIR}/libs/openFrameworksCompiled/lib/vs/Win32)
MARK_AS_ADVANCED(openFrameworks_LIBRARY_DEBUG)


IF(${PLATFORM} MATCHES "vs")
set(openFrameworks_DEFINITIONS 
        "-DWIN32" 
        "-DNDEBUG" 
        "-D_CONSOLE" 
        "-DDISABLE_SOME_FLOATING_POINT"
        )
set(openFrameworks_DEFINITIONS_DEBUG 
        "-DWIN32" 
        "-D_DEBUG" 
        "-D_CONSOLE" 
        "-DDISABLE_SOME_FLOATING_POINT"
        )
ENDIF(${PLATFORM} MATCHES "vs")




INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(openFrameworks DEFAULT_MSG openFrameworks_LIBRARY openFrameworks_LIBRARY_DEBUG openFrameworks_INCLUDE_DIR)

IF ("${openFrameworks_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (openFrameworks_LIBRARY)
    SET (openFrameworks_LIBRARY_DEBUG)
    SET (openFrameworks_INCLUDE_DIR)
ELSEIF ("${openFrameworks_LIBRARY}" MATCHES "NOTFOUND")
    SET (openFrameworks_LIBRARY)
    SET (openFrameworks_LIBRARY_DEBUG)
    SET (openFrameworks_INCLUDE_DIR)
ELSEIF ("${openFrameworks_LIBRARY_DEBUG}" MATCHES "NOTFOUND")
    SET (openFrameworks_LIBRARY)
    SET (openFrameworks_LIBRARY_DEBUG)
    SET (openFrameworks_INCLUDE_DIR)
ELSE ("${openFrameworks_INCLUDE_DIR}" MATCHES "NOTFOUND")
    SET (openFrameworks_FOUND 1)
    SET (openFrameworks_LIBRARIES ${openFrameworks_LIBRARY} ${DEPEND_LYBRARIES_RELEASE})
    SET (openFrameworks_LIBRARIES_DEBUG ${openFrameworks_LIBRARY_DEBUG} ${DEPEND_LYBRARIES_DEBUG})
    SET (openFrameworks_INCLUDE_DIRS ${openFrameworks_INCLUDE_DIR} ${DEPEND_INCLUDE_DIRS})
ENDIF ("${openFrameworks_INCLUDE_DIR}" MATCHES "NOTFOUND")
