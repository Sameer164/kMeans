cmake_minimum_required(VERSION 3.5)
project (kMeansPython)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
add_subdirectory(cc_api)
add_subdirectory(extern/pybind11)

pybind11_add_module(kMeansPyExport main.cpp)
target_link_libraries(kMeansPyExport PUBLIC kMeans)
