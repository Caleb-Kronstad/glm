project(GLM LANGUAGES CXX)

  # GLM source files (matching Build-GLM.lua)
  # Note: GLM is mostly header-only, but Premake includes a placeholder.cpp
  set(GLM_SOURCES
      glm/placeholder.cpp
  )

  # Collect all GLM headers
  file(GLOB GLM_HEADERS
      "glm/*.hpp"
  )

  file(GLOB_RECURSE GLM_GTC_SOURCES "glm/gtc/*.cpp")
  file(GLOB_RECURSE GLM_GTC_HEADERS "glm/gtc/*.hpp")
  file(GLOB_RECURSE GLM_GTX_SOURCES "glm/gtx/*.cpp")
  file(GLOB_RECURSE GLM_GTX_HEADERS "glm/gtx/*.hpp")

  # Create static library (matching Premake's StaticLib)
  add_library(GLM STATIC
      ${GLM_SOURCES}
      ${GLM_HEADERS}
      ${GLM_GTC_SOURCES}
      ${GLM_GTC_HEADERS}
      ${GLM_GTX_SOURCES}
      ${GLM_GTX_HEADERS}
  )

  # Include directories
  target_include_directories(GLM PUBLIC
      ${CMAKE_CURRENT_SOURCE_DIR}/glm
  )

  # Defines (matching Build-GLM.lua)
  target_compile_definitions(GLM PUBLIC
      GLM_ENABLE_EXPERIMENTAL
  )

  # Set output directory
  set_target_properties(GLM PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Build/Binaries/${OUTPUT_DIR}/Project/Dependencies/GLM"
  )
