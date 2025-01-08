#!/bin/bash

# Function to display help information
display_help() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -t <debug/release>   Set the build type (default: debug)"
  echo "  -m <1/0>             Enable or disable testing (default: on)"
  echo "  -g <asan>            Enable AddressSanitizer (default: off)"
  echo "  -c <1/0>             Enable or disable Git hooks (default: off)"
  echo "  -h                   Display this help message"
  exit 0
}

# Default values
BUILD_TYPE="Debug"
ENABLE_TESTING="ON"
ENABLE_ASAN="OFF"
ENABLE_GITHOOK="OFF"

# Parse input parameters
while getopts ":t:m:g:c:h" opt; do
  case ${opt} in
    t ) if [ "${OPTARG,,}" == "release" ]; then BUILD_TYPE="Release"; fi ;; # Convert to uppercase
    m ) if [ "${OPTARG,,}" == "0" ]; then ENABLE_TESTING="OFF"; fi ;;
    g ) if [ "${OPTARG,,}" == "asan" ]; then ENABLE_ASAN="ON"; fi ;;
    c ) if [ "${OPTARG,,}" == "1" ]; then ENABLE_GITHOOK="ON"; fi ;;
    h ) display_help ;; # Display help for invalid option
    : ) echo "Invalid option: -$OPTARG requires an argument" >&2; exit 1 ;; # Option requires an argument
  esac
done

# Source the toolchain environment
source /opt/redzippydb/toolset/gcc/7.5.0/enable
export LD_LIBRARY_PATH=/opt/redzippydb/toolset/gcc/7.5.0/lib64:$LD_LIBRARY_PATH
# export CC=/opt/redzippydb/toolset/gcc/7.5.0/bin/gcc
# export CXX=/opt/redzippydb/toolset/gcc/7.5.0/bin/g++

echo $CC
echo $CXX
echo $LD_LIBRARY_PATH

echo "$BUILD_TYPE" 
echo "$ENABLE_TESTING"
echo "$ENABLE_ASAN"
echo "$ENABLE_GITHOOK"

# Check if the build type is valid
if [ "$BUILD_TYPE" != "Debug" ] && [ "$BUILD_TYPE" != "Release" ]; then
  echo "Error: -t must be 'debug' or 'release'."
  exit 1
fi

# Clean up the old build directory and create a new one
rm -fr build
mkdir -p build && cd build || { echo "Failed to enter the build directory."; exit 1; }

# Configure CMake with the specified options
cmake \
      -DENABLE_TESTING=$ENABLE_TESTING \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
      -DENABLE_ASAN=$ENABLE_ASAN \
      -DENABLE_GITHOOK=$ENABLE_GITHOOK \
      ..

# Build the project using make with 10 parallel jobs
make -j10

