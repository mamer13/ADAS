# CMake generated Testfile for 
# Source directory: C:/Users/muham/Downloads/vscode/Lab1
# Build directory: C:/Users/muham/Downloads/vscode/Lab1/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(LaneDetectionTests "C:/Users/muham/Downloads/vscode/Lab1/build/Debug/test_lane_detection.exe")
  set_tests_properties(LaneDetectionTests PROPERTIES  ENVIRONMENT "OPENCV_IO_MAX_IMAGE_PIXELS=0" TIMEOUT "300" _BACKTRACE_TRIPLES "C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;29;add_test;C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(LaneDetectionTests "C:/Users/muham/Downloads/vscode/Lab1/build/Release/test_lane_detection.exe")
  set_tests_properties(LaneDetectionTests PROPERTIES  ENVIRONMENT "OPENCV_IO_MAX_IMAGE_PIXELS=0" TIMEOUT "300" _BACKTRACE_TRIPLES "C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;29;add_test;C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(LaneDetectionTests "C:/Users/muham/Downloads/vscode/Lab1/build/MinSizeRel/test_lane_detection.exe")
  set_tests_properties(LaneDetectionTests PROPERTIES  ENVIRONMENT "OPENCV_IO_MAX_IMAGE_PIXELS=0" TIMEOUT "300" _BACKTRACE_TRIPLES "C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;29;add_test;C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(LaneDetectionTests "C:/Users/muham/Downloads/vscode/Lab1/build/RelWithDebInfo/test_lane_detection.exe")
  set_tests_properties(LaneDetectionTests PROPERTIES  ENVIRONMENT "OPENCV_IO_MAX_IMAGE_PIXELS=0" TIMEOUT "300" _BACKTRACE_TRIPLES "C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;29;add_test;C:/Users/muham/Downloads/vscode/Lab1/CMakeLists.txt;0;")
else()
  add_test(LaneDetectionTests NOT_AVAILABLE)
endif()
