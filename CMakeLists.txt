cmake_minimum_required(VERSION 3.27)
project(mylib CXX)
include(GNUInstallDirs)
include(ExternalProject)

# mylib
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(mylib SHARED
    src/mylib.cpp
)
set_target_properties(mylib PROPERTIES PUBLIC_HEADER src/mylib.h)
install(TARGETS mylib)

# yourlib
execute_process(
  COMMAND ${CMAKE_COMMAND} -S "${CMAKE_CURRENT_SOURCE_DIR}/yourlib" -B "${CMAKE_CURRENT_BINARY_DIR}/yourlib" -DCMAKE_INSTALL_PREFIX=install
)
execute_process(
  COMMAND ${CMAKE_COMMAND} --build "${CMAKE_CURRENT_BINARY_DIR}/yourlib"
)
execute_process(
  COMMAND ${CMAKE_COMMAND} --install "${CMAKE_CURRENT_BINARY_DIR}/yourlib"
)
set(yourlib_DIR "${CMAKE_CURRENT_BINARY_DIR}/yourlib/install")
find_package(yourlib)

# ourlib (module)
find_package(Python COMPONENTS Interpreter Development)
find_package(pybind11 CONFIG)
if(NOT pybind11_FOUND)
  add_subdirectory(pybind11)
endif()

pybind11_add_module(mymod src/module.cpp)
target_link_libraries(mymod PUBLIC mylib yourlib)
install(TARGETS mymod DESTINATION ${CMAKE_INSTALL_PREFIX})
