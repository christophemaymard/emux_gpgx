cmake_minimum_required(VERSION 3.15)

project(EmuX_GPGX LANGUAGES C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(group_target_sources_by_directory_structure)

if(MSVC)
    add_compile_definitions("$<IF:$<CONFIG:Debug>,_DEBUG,NDEBUG>")
    add_compile_definitions(UNICODE _UNICODE)
endif()

add_subdirectory(3rdparty)

if(MSVC)
    add_compile_options(/std:c++17)     
endif()

add_compile_definitions(LSB_FIRST)
add_compile_definitions("INLINE=static inline")

add_compile_definitions(USE_16BPP_RENDERING)
add_compile_definitions(MAXROMSIZE=33554432)
add_compile_definitions(HAVE_YM3438_CORE)
add_compile_definitions(HAVE_OPLL_CORE)

add_compile_definitions(ENABLE_SUB_68K_ADDRESS_ERROR_EXCEPTIONS)
add_compile_definitions(HOOK_CPU)

add_compile_definitions(LOGERROR)
add_compile_definitions(LOGVDP)
add_compile_definitions(LOGSOUND)
add_compile_definitions(LOG_SCD)
add_compile_definitions(LOG_CDD)
add_compile_definitions(LOG_CDC)
add_compile_definitions(LOG_PCM)

if(MSVC)
    add_compile_definitions(_CRT_SECURE_NO_WARNINGS)
    add_compile_definitions(_CONSOLE)
endif()

if (MSVC)
    add_compile_options(
        /permissive-    # Conformance mode: Yes
        /sdl-           # Security Development Lifecycle (SDL) checks: No
        /Zc:inline      # Remove unreferenced code and data: Yes
        /WX-            # Treat warnings as errors: No
        /EHsc           # Enable C++ exceptions: Yes
    )
    
    # Warning level: Level4 if Debug, otherwise Level3.
    add_compile_options("$<IF:$<CONFIG:Debug>,/W4,/W3>")
    
    # Security check: Enable if Debug, otherwise Disable
    add_compile_options("$<IF:$<CONFIG:Debug>,/GS,/GS->")
    
    # Debug information format: Program Database for Edit And Continue fi Debug, otherwise Program Database.
    add_compile_options("$<IF:$<CONFIG:Debug>,/ZI,/Zi>")
    
    # Optimization: Disabled if Debug, otherwise Maximum Optimization (Favor Speed).
    add_compile_options("$<IF:$<CONFIG:Debug>,/Od,/O2>")
    
    # Runtime library: Multi-threaded Debug DLL if Debug, otherwise Multi-threaded DLL.
    add_compile_options("$<IF:$<CONFIG:Debug>,/MDd,/MD>")
    
    # Whole program optimization: Yes if not Debug.
    add_compile_options("$<IF:$<CONFIG:Debug>,,/GL>")
endif()

include_directories(
    src/core
    src/core/z80
    src/core/m68k
    src/core/sound
    src/core/sound/minimp3
    src/core/sound/tremor
    src/core/input_hw
    src/core/cart_hw
    src/core/cart_hw/svp
    src/core/cd_hw
    src/core/ntsc
    src/core/debug
    src/frontend/cli_sdl
)

add_subdirectory(src)

set_directory_properties(PROPERTIES VS_STARTUP_PROJECT emux_cli)
