@echo off
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%
echo Testing Google Test...
test_lane_detection.exe --help
echo.
echo Exit code: %ERRORLEVEL%
