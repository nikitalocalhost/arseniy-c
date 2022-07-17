install(
    TARGETS arseniy-c_exe
    RUNTIME COMPONENT arseniy-c_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
