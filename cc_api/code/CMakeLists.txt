file (GLOB source_files ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc)
add_library(kMeans ${source_files})
target_include_directories (kMeans PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include/)
