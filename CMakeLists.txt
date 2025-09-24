cmake_minimum_required(VERSION 3.27)
project(example CXX)
include(GNUInstallDirs)

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(mylib SHARED
    src/mylib.cpp
)
set_target_properties(mylib PROPERTIES PUBLIC_HEADER src/mylib.h)
install(TARGETS mylib)

find_package(Python COMPONENTS Interpreter Development)
find_package(pybind11 CONFIG)
if(NOT pybind11_FOUND)
  add_subdirectory(pybind11)
endif()

pybind11_add_module(mymod src/module.cpp)
target_link_libraries(mymod PUBLIC mylib)
install(TARGETS mymod DESTINATION ${CMAKE_INSTALL_PREFIX})
