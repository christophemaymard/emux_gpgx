add_library(3rdparty_sdl INTERFACE)

if(NOT WIN32)
    option(SDL2_DISABLE_SDL2MAIN "" ON)
endif()

set(SDL_SHARED_ENABLED_BY_DEFAULT OFF)
set(SDL_TEST_ENABLED_BY_DEFAULT OFF)
add_subdirectory(SDL EXCLUDE_FROM_ALL)

if(WIN32)
    # Must be added before SDL2::SDL2-static.
    target_link_libraries(3rdparty_sdl INTERFACE SDL2::SDL2main)
endif()

target_link_libraries(3rdparty_sdl INTERFACE SDL2::SDL2-static)
