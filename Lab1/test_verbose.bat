@echo off
echo ========================================
echo    Verbose Test Runner
echo ========================================
echo.

REM Set the PATH to include vcpkg libraries
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%

REM Change to the Release directory
cd /d "%~dp0build\Release"

echo Available test options:
echo.
echo 1. List all tests
echo 2. Run all tests with verbose output
echo 3. Run specific test
echo 4. Run tests with detailed output
echo.

set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo Listing all available tests...
    test_lane_detection.exe --gtest_list_tests
) else if "%choice%"=="2" (
    echo.
    echo Running all tests with verbose output...
    test_lane_detection.exe --gtest_verbose
) else if "%choice%"=="3" (
    echo.
    set /p testname="Enter test name (e.g., LaneDetectionTest.ExtractLinesBasic): "
    echo Running specific test: %testname%
    test_lane_detection.exe --gtest_filter=%testname%
) else if "%choice%"=="4" (
    echo.
    echo Running tests with detailed output and XML results...
    test_lane_detection.exe --gtest_output=xml:test_results.xml --gtest_verbose
) else (
    echo Invalid choice!
)

echo.
pause
