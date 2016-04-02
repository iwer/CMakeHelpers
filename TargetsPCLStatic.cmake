find_package(PCL 1.7 REQUIRED)
link_directories(${PCL_LIBRARY_DIR})

add_library(pcl-common STATIC IMPORTED)
set_property(TARGET pcl-common PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-common PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-common PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_COMMON_LIBRARY})
set_property(TARGET pcl-common PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_COMMON_LIBRARY_DEBUG})

add_library(pcl-octree STATIC IMPORTED)
set_property(TARGET pcl-octree PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-octree PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-octree PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_OCTREE_LIBRARY})
set_property(TARGET pcl-octree PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_OCTREE_LIBRARY_DEBUG})

add_library(pcl-io STATIC IMPORTED)
set_property(TARGET pcl-io PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-io PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-io PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_IO_LIBRARY})
set_property(TARGET pcl-io PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_IO_LIBRARY_DEBUG})

add_library(pcl-kdtree STATIC IMPORTED)
set_property(TARGET pcl-kdtree PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-kdtree PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-kdtree PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_KDTREE_LIBRARY})
set_property(TARGET pcl-kdtree PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_KDTREE_LIBRARY_DEBUG})

add_library(pcl-search STATIC IMPORTED)
set_property(TARGET pcl-search PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-search PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-search PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_SEARCH_LIBRARY})
set_property(TARGET pcl-search PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_SEARCH_LIBRARY_DEBUG})
	
add_library(pcl-sample-consensus STATIC IMPORTED)
set_property(TARGET pcl-sample-consensus PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-sample-consensus PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-sample-consensus PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_SAMPLE_CONSENSUS_LIBRARY})
set_property(TARGET pcl-sample-consensus PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_SAMPLE_CONSENSUS_LIBRARY_DEBUG})

add_library(pcl-filters STATIC IMPORTED)
set_property(TARGET pcl-filters PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-filters PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-filters PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_FILTERS_LIBRARY})
set_property(TARGET pcl-filters PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_FILTERS_LIBRARY_DEBUG})

add_library(pcl-2d STATIC IMPORTED)
set_property(TARGET pcl-2d PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-2d PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-2d PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_2D_LIBRARY})
set_property(TARGET pcl-2d PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_2D_LIBRARY_DEBUG})

add_library(pcl-geometry STATIC IMPORTED)
set_property(TARGET pcl-geometry PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-geometry PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
#set_property(TARGET pcl-geometry PROPERTY 
#	IMPORTED_LOCATION_RELEASE ${PCL_GEOMETRY_LIBRARY})
#set_property(TARGET pcl-geometry PROPERTY 
#	IMPORTED_LOCATION_DEBUG ${PCL_GEOMETRY_LIBRARY_DEBUG})

add_library(pcl-features STATIC IMPORTED)
set_property(TARGET pcl-features PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-features PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-features PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_FEATURES_LIBRARY})
set_property(TARGET pcl-features PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_FEATURES_LIBRARY_DEBUG})

add_library(pcl-ml STATIC IMPORTED)
set_property(TARGET pcl-ml PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-ml PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-ml PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_ML_LIBRARY})
set_property(TARGET pcl-ml PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_ML_LIBRARY_DEBUG})

add_library(pcl-segmentation STATIC IMPORTED)
set_property(TARGET pcl-segmentation PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-segmentation PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-segmentation PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_SEGMENTATION_LIBRARY})
set_property(TARGET pcl-segmentation PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_SEGMENTATION_LIBRARY_DEBUG})

add_library(pcl-visualization STATIC IMPORTED)
set_property(TARGET pcl-visualization PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-visualization PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-visualization PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_VISUALIZATION_LIBRARY})
set_property(TARGET pcl-visualization PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_VISUALIZATION_LIBRARY_DEBUG})

add_library(pcl-surface STATIC IMPORTED)
set_property(TARGET pcl-surface PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-surface PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-surface PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_SURFACE_LIBRARY})
set_property(TARGET pcl-surface PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_SURFACE_LIBRARY_DEBUG})

add_library(pcl-registration STATIC IMPORTED)
set_property(TARGET pcl-registration PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-registration PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-registration PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_REGISTRATION_LIBRARY})
set_property(TARGET pcl-registration PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_REGISTRATION_LIBRARY_DEBUG})

add_library(pcl-keypoints STATIC IMPORTED)
set_property(TARGET pcl-keypoints PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-keypoints PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-keypoints PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_KEYPOINTS_LIBRARY})
set_property(TARGET pcl-keypoints PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_KEYPOINTS_LIBRARY_DEBUG})

add_library(pcl-tracking STATIC IMPORTED)
set_property(TARGET pcl-tracking PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-tracking PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-tracking PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_TRACKING_LIBRARY})
set_property(TARGET pcl-tracking PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_TRACKING_LIBRARY_DEBUG})

add_library(pcl-recognition STATIC IMPORTED)
set_property(TARGET pcl-recognition PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-recognition PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-recognition PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_RECOGNITION_LIBRARY})
set_property(TARGET pcl-recognition PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_RECOGNITION_LIBRARY_DEBUG})

add_library(pcl-stereo STATIC IMPORTED)
set_property(TARGET pcl-stereo PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-stereo PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-stereo PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_STEREO_LIBRARY})
set_property(TARGET pcl-stereo PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_STEREO_LIBRARY_DEBUG})

add_library(pcl-outofcore STATIC IMPORTED)
set_property(TARGET pcl-outofcore PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-outofcore PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-outofcore PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_OUTOFCORE_LIBRARY})
set_property(TARGET pcl-outofcore PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_OUTOFCORE_LIBRARY_DEBUG})
	
add_library(pcl-people STATIC IMPORTED)
set_property(TARGET pcl-people PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES ${PCL_INCLUDE_DIRS})
set_property(TARGET pcl-people PROPERTY
	INTERFACE_COMPILE_DEFINITIONS ${PCL_DEFINITIONS})
set_property(TARGET pcl-people PROPERTY 
	IMPORTED_LOCATION_RELEASE ${PCL_PEOPLE_LIBRARY})
set_property(TARGET pcl-people PROPERTY 
	IMPORTED_LOCATION_DEBUG ${PCL_PEOPLE_LIBRARY_DEBUG})
	




	
	