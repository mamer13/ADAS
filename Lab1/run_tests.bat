@echo off
echo ========================================
echo    Lane Detection Test Runner
echo ========================================
echo.

REM Set the PATH to include vcpkg libraries
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%

REM Change to the Release directory where the executable is
cd /d "%~dp0build\Release"

echo Running Google Tests...
echo.

REM Run the tests with verbose output
test_lane_detection.exe --gtest_output=xml:test_results.xml

echo.
echo ========================================
echo Test execution completed!
echo Results saved to: build\Release\test_results.xml
echo ========================================
pause
