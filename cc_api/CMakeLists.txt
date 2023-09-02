cmake_minimum_required(VERSION 3.5)
project (kNeighborsAPI)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_EXTENSIONS OFF)

enable_testing()

add_subdirectory(code)
add_subdirectory(tests)

add_executable(kNeighborsAPIExec main.cpp)
target_link_libraries(kNeighborsAPIExec PUBLIC kMeans)

