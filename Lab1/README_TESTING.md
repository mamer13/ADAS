# Lane Detection Testing Guide

This guide explains how to run the Google Tests for the Lane Detection project.

## Quick Start

### Option 1: Simple Test Run
Double-click `run_tests.bat` or run from command line:
```cmd
run_tests.bat
```

### Option 2: Build and Test
If you've made changes to the code, use:
```cmd
build_and_test.bat
```

### Option 3: Interactive Test Runner
For more control over test execution:
```cmd
test_verbose.bat
```

## Test Workflow

### When You Add New Test Cases:

1. **Edit the test file**: Modify `test_lane_detection.cpp` to add your new tests
2. **Rebuild**: Run `build_and_test.bat` to compile your changes
3. **Run tests**: The script will automatically run all tests after building

### Manual Commands

If you prefer to run commands manually:

```cmd
# Navigate to project root
cd C:\Users\muham\Downloads\vscode\Lab1

# Build the project
cmake --build build --config Release

# Run tests
cd build\Release
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%
test_lane_detection.exe
```

## Test Options

### List All Tests
```cmd
test_lane_detection.exe --gtest_list_tests
```

### Run Specific Test
```cmd
test_lane_detection.exe --gtest_filter=LaneDetectionTest.ExtractLinesBasic
```

### Run with Verbose Output
```cmd
test_lane_detection.exe --gtest_verbose
```

### Generate XML Report
```cmd
test_lane_detection.exe --gtest_output=xml:test_results.xml
```

### Run Only Failed Tests
```cmd
test_lane_detection.exe --gtest_also_run_disabled_tests
```

## Adding New Tests

To add new test cases:

1. Open `test_lane_detection.cpp`
2. Add your test functions using the `TEST_F` macro:
   ```cpp
   TEST_F(LaneDetectionTest, YourNewTestName) {
       // Your test code here
       EXPECT_TRUE(someCondition);
   }
   ```
3. Run `build_and_test.bat` to compile and test

## Test Structure

The tests are organized in the `LaneDetectionTest` class which provides:
- `mockImage`: Empty test image
- `testImage`: Image with test lines drawn
- `expectedLines`: Expected line coordinates for validation

## Common Issues

### DLL Not Found Error
If you get DLL errors, make sure the vcpkg path is set:
```cmd
set PATH=C:\Users\muham\Downloads\vscode\Lab1\vcpkg\installed\x64-windows\bin;%PATH%
```

### Build Errors
If build fails, try:
```cmd
cmake --build build --config Release --clean-first
```

### Test Failures
Check the console output for specific error messages. Common issues:
- Image format problems (CV_8U depth required for Canny)
- Missing function implementations
- Incorrect test expectations

## File Locations

- **Test Source**: `test_lane_detection.cpp`
- **Header**: `lane_detection.h`
- **Executable**: `build\Release\test_lane_detection.exe`
- **Results**: `build\Release\test_results.xml`
