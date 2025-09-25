cmake_minimum_required(VERSION 3.27)
project(yourlib CXX)
include(GNUInstallDirs)

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(yourlib SHARED
  yourlib.cpp
)
target_include_directories(yourlib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
install(TARGETS yourlib EXPORT yourlibTargets)
install(EXPORT yourlibTargets FILE yourlibTargets.cmake NAMESPACE yourlib:: DESTINATION .)

include(CMakePackageConfigHelpers)
configure_package_config_file(
  yourlibConfig.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/yourlibConfig.cmake
  INSTALL_DESTINATION .
)
install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/yourlibConfig.cmake
  DESTINATION .
)
