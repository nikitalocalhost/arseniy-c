# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(arseniy-cTests LANGUAGES CXX)

# ---- Tests ----

add_executable(arseniy-c_test source/arseniy-c_test.cpp)
target_link_libraries(arseniy-c_test PRIVATE arseniy-c_lib)
target_compile_features(arseniy-c_test PRIVATE cxx_std_11)

add_test(NAME arseniy-c_test COMMAND arseniy-c_test)

# ---- End-of-file commands ----

add_folders(Test)
