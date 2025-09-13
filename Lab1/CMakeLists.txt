cmake_minimum_required(VERSION 3.16)
project(LaneDetectionTests)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(OpenCV REQUIRED)
find_package(GTest REQUIRED)

# Create test executable
add_executable(test_lane_detection test_lane_detection.cpp)

# Link libraries
target_link_libraries(test_lane_detection 
    opencv_core
    opencv_imgproc
    opencv_imgcodecs
    opencv_highgui
    GTest::gtest
    GTest::gtest_main
)

# Enable testing
enable_testing()

# Add test
add_test(NAME LaneDetectionTests COMMAND test_lane_detection)

# Set test properties
set_tests_properties(LaneDetectionTests PROPERTIES
    TIMEOUT 300
    ENVIRONMENT "OPENCV_IO_MAX_IMAGE_PIXELS=0"
)

# Compiler flags
if(MSVC)
    target_compile_options(test_lane_detection PRIVATE /W4)
else()
    target_compile_options(test_lane_detection PRIVATE -Wall -Wextra -Wpedantic)
endif()

# Print configuration info
message(STATUS "OpenCV version: ${OpenCV_VERSION}")
message(STATUS "OpenCV libraries: ${OpenCV_LIBS}")
message(STATUS "OpenCV include path: ${OpenCV_INCLUDE_DIRS}")
message(STATUS "GTest found: ${GTEST_FOUND}")
message(STATUS "GTest libraries: ${GTEST_LIBRARIES}")
message(STATUS "GTest include path: ${GTEST_INCLUDE_DIRS}")

# Optional: Create a library target for the lane detection functions
# add_library(lane_detection STATIC
#     # Add your source files here
#     # lane_detection.cpp
#     # preprocess.cpp
#     # line_extraction.cpp
# )
# 
# target_link_libraries(lane_detection opencv_core opencv_imgproc opencv_imgcodecs opencv_highgui)
# target_link_libraries(test_lane_detection lane_detection)