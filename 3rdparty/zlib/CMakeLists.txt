option(ZLIB_BUILD_EXAMPLES "Enable Zlib Examples" OFF)
set(SKIP_INSTALL_ALL ON)
add_subdirectory(zlib EXCLUDE_FROM_ALL)

add_library(3rdparty_zlib INTERFACE)

target_compile_definitions(3rdparty_zlib INTERFACE -DZLIB_CONST=1)
target_link_libraries(3rdparty_zlib INTERFACE zlibstatic)
