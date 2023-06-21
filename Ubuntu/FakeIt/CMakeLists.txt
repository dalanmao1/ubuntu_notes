cmake_minimum_required(VERSION 3.0)
project(cmake_test VERSION 0.0.1 LANGUAGES CXX)






find_package(CURL)
add_executable(curltest curltest.cc)
if(CURL_FOUND)
    target_include_directories(clib PRIVATE ${CURL_INCLUDE_DIR})
    target_link_libraries(curltest ${CURL_LIBRARY})
else(CURL_FOUND)
    message(FATAL_ERROR ”CURL library not found”)
endif(CURL_FOUND)





add_subdirectory(doctest)

add_executable(my_tests test.cpp)

target_link_libraries(my_tests doctest)

# # add it globally
# include_directories(${DOCTEST_INCLUDE_DIR})

# # or per target
# target_include_directories(my_tests PUBLIC ${DOCTEST_INCLUDE_DIR})

# # target_link_libraries(my_tests doctest)