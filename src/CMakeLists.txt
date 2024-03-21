# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(ghostscript_dart_library VERSION 0.0.1 LANGUAGES C)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

add_library(ghostscript_dart SHARED
  "ghostscript_dart.c"
)

include (FindPackageHandleStandardArgs)
find_package(GHOSTSCRIPT REQUIRED)

set_target_properties(ghostscript_dart PROPERTIES
  PUBLIC_HEADER ghostscript_dart.h
  OUTPUT_NAME "ghostscript_dart"
)

target_compile_definitions(ghostscript_dart PUBLIC DART_SHARED_LIB)
target_link_libraries(ghostscript_dart ${GHOSTSCRIPT_LIB})
