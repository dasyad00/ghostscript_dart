# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(ghostscript_dart_library VERSION 0.0.1 LANGUAGES C)

add_library(ghostscript_dart SHARED
  "ghostscript_dart.c"
)

set(GSDLL_PATH "C:\\Program Files\\gs\\gs10.02.1\\bin")

set_target_properties(ghostscript_dart PROPERTIES
  PUBLIC_HEADER ghostscript_dart.h
  OUTPUT_NAME "ghostscript_dart"
)

target_compile_definitions(ghostscript_dart PUBLIC DART_SHARED_LIB)
target_link_libraries(ghostscript_dart  "${GSDLL_PATH}\\gsdll64.lib")
