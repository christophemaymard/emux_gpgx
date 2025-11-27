add_executable(emux_cli)

target_sources(emux_cli
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/config.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/config.h
        ${CMAKE_CURRENT_SOURCE_DIR}/error.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/error.h
        ${CMAKE_CURRENT_SOURCE_DIR}/fileio.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/fileio.h
        ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/main.h
        ${CMAKE_CURRENT_SOURCE_DIR}/osd.h
        ${CMAKE_CURRENT_SOURCE_DIR}/unzip.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/unzip.h
)

target_link_libraries(emux_cli
    PRIVATE
        3rdparty::sdl
        3rdparty::zlib
        emux_core
)

group_target_sources_by_directory_structure(emux_cli)
