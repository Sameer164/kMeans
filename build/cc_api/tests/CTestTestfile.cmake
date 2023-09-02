# CMake generated Testfile for 
# Source directory: /home/sameeracharya/Desktop/dev/kNN/cc_api/tests
# Build directory: /home/sameeracharya/Desktop/dev/kNN/build/cc_api/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(kMeans_gTest "kMeans_test")
set_tests_properties(kMeans_gTest PROPERTIES  _BACKTRACE_TRIPLES "/home/sameeracharya/Desktop/dev/kNN/cc_api/tests/CMakeLists.txt;14;add_test;/home/sameeracharya/Desktop/dev/kNN/cc_api/tests/CMakeLists.txt;0;")
subdirs("../../_deps/googletest-build")
