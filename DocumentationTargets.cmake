# Michael Aaron Safyan (michaelsafyan@gmail.com). Copyright (C) 2009. Simplified BSD License.

#
# This CMake package creates a Doxygen documentation target.
#

FIND_PACKAGE (Doxygen)
IF (DOXYGEN_FOUND)
    IF (EXISTS ${PROJECT_SOURCE_DIR}/Doxyfile)
        ADD_CUSTOM_TARGET(
            ${PROJECT_NAME}-doxygen
            ${DOXYGEN_EXECUTABLE} Doxyfile
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            COMMENT "Generating doxygen project documentation." VERBATIM
        )
        ADD_CUSTOM_TARGET(
            ${PROJECT_NAME}-documentation
            ${DOXYGEN_EXECUTABLE} Doxyfile
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            COMMENT "Generating doxygen project documentation." VERBATIM
        )
        ADD_CUSTOM_TARGET(
            ${PROJECT_NAME}-docs
            ${DOXYGEN_EXECUTABLE} Doxyfile
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            COMMENT "Generating doxygen project documentation." VERBATIM
        )
    ELSE (EXISTS ${PROJECT_SOURCE_DIR}/Doxyfile)
        ADD_CUSTOM_TARGET(${PROJECT_NAME}-doxygen COMMENT "Doxyfile not found. Please generate a doxygen configuration file to use this target." VERBATIM)
        ADD_CUSTOM_TARGET(${PROJECT_NAME}-documentation COMMENT "Doxyfile not found. Please generate a doxygen configuration file to use this target." VERBATIM)
        ADD_CUSTOM_TARGET(${PROJECT_NAME}-docs COMMENT "Doxyfile not found. Please generate a doxygen configuration file to use this target." VERBATIM)
    ENDIF (EXISTS ${PROJECT_SOURCE_DIR}/Doxyfile)
ELSE (DOXYGEN_FOUND)
    ADD_CUSTOM_TARGET(${PROJECT_NAME}-doxygen COMMENT "Doxygen not found. Please install doxygen to use this target." VERBATIM)
    ADD_CUSTOM_TARGET(${PROJECT_NAME}-documentation COMMENT "Doxygen not found. Please install doxygen to use this target." VERBATIM)
    ADD_CUSTOM_TARGET(${PROJECT_NAME}-docs COMMENT "Doxygen not found. Please install doxygen to use this target." VERBATIM)
ENDIF (DOXYGEN_FOUND)
