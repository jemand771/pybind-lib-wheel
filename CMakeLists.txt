cmake_minimum_required(VERSION 3.31)
project(example CXX)
include(GNUInstallDirs)

add_library(mylib SHARED
    src/mylib.cpp
)
set_target_properties(mylib PROPERTIES PUBLIC_HEADER src/mylib.h)
install(TARGETS mylib)

find_package(Python COMPONENTS Interpreter Development)
find_package(pybind11 CONFIG)

pybind11_add_module(mymod src/module.cpp)
target_link_libraries(mymod PUBLIC mylib)
install(TARGETS mymod DESTINATION ${CMAKE_INSTALL_PREFIX})
