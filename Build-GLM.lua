project "GLM"
    location "../../../Build/Build-Files"
    kind "StaticLib"
    language "C++"

    targetdir ("../../../Build/Binaries/" .. OutputDir .. "/Project/Dependencies/%{prj.name}")
    objdir ("../../../Build/Binaries-Intermediate/" .. OutputDir .. "/Project/Dependencies/%{prj.name}")

    files {
        "glm/placeholder.cpp",
        "glm/common.hpp",
        "glm/exponential.hpp",
        "glm/ext.hpp",
        "glm/fwd.hpp",
        "glm/geometric.hpp",
        "glm/glm.hpp",
        "glm/integer.hpp",
        "glm/mat2x2.hpp",
        "glm/mat2x3.hpp",
        "glm/mat2x4.hpp",
        "glm/mat3x2.hpp",
        "glm/mat3x3.hpp",
        "glm/mat3x4.hpp",
        "glm/mat4x2.hpp",
        "glm/mat4x3.hpp",
        "glm/mat4x4.hpp",
        "glm/matrix.hpp",
        "glm/packing.hpp",
        "glm/trigonometric.hpp",
        "glm/vec2.hpp",
        "glm/vec3.hpp",
        "glm/vec4.hpp",
        "glm/vector_relational.hpp",
        "glm/gtc/**cpp",
        "glm/gtc/**hpp",
        "glm/gtx/**cpp",
        "glm/gtx/**hpp",
    }

    defines {
        "GLM_ENABLE_EXPERIMENTAL"
    }

    filter "system:windows"
        systemversion "latest"
        defines {
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "system:linux"
        pic "On"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
