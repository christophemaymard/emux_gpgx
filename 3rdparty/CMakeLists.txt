add_subdirectory(sdl EXCLUDE_FROM_ALL)
add_subdirectory(zlib EXCLUDE_FROM_ALL)

add_library(3rdparty::sdl ALIAS 3rdparty_sdl)
add_library(3rdparty::zlib ALIAS 3rdparty_zlib)
