@echo off
echo ========================================
echo    Build and Test Lane Detection
echo ========================================
echo.

REM Change to the project root directory
cd /d "%~dp0"

echo Step 1: Building the project...
echo.

REM Build the project using CMake
cmake --build build --config Release

if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Build failed!
    echo Please check the build output above for errors.
    pause
    exit /b 1
)

echo.
echo Step 2: Running tests...
echo.

REM Set the PATH to include vcpkg libraries
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%

REM Change to the Release directory
cd build\Release

REM Run the tests
test_lane_detection.exe --gtest_output=xml:test_results.xml

echo.
echo ========================================
echo Build and test completed!
echo Results saved to: build\Release\test_results.xml
echo ========================================
pause
