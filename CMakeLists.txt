cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    arseniy-c
    VERSION 0.1.0
    DESCRIPTION "Repo for Arseniy to learn c"
    HOMEPAGE_URL "https://github.com/nikitalocalhost/arseniy-c"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    arseniy-c_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    arseniy-c_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(arseniy-c_lib PUBLIC cxx_std_11)

# ---- Declare executable ----

add_executable(arseniy-c_exe source/main.cpp)
add_executable(arseniy-c::exe ALIAS arseniy-c_exe)

set_target_properties(
    arseniy-c_exe PROPERTIES
    OUTPUT_NAME arseniy-c
    EXPORT_NAME exe
)

target_compile_features(arseniy-c_exe PRIVATE cxx_std_11)

target_link_libraries(arseniy-c_exe PRIVATE arseniy-c_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT arseniy-c_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of arseniy-c"
  )
endif()

include(cmake/dev-mode.cmake)
