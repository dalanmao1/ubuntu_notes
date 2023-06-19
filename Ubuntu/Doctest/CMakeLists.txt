cmake_minimum_required(VERSION 3.0)
project(cmake_test VERSION 0.0.1 LANGUAGES CXX)

add_subdirectory(doctest)

add_executable(my_tests test.cpp)

target_link_libraries(my_tests doctest)

# # add it globally
# include_directories(${DOCTEST_INCLUDE_DIR})

# # or per target
# target_include_directories(my_tests PUBLIC ${DOCTEST_INCLUDE_DIR})

# # target_link_libraries(my_tests doctest)