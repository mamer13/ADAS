@echo off
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%
echo Running Google Tests...
test_lane_detection.exe --gtest_list_tests
echo.
echo Running all tests...
test_lane_detection.exe --gtest_output=xml:test_results.xml
echo.
echo Test execution completed.
