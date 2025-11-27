function(group_target_sources_by_directory_structure target)
    get_target_property(file_paths "${target}" SOURCES)
    
    foreach(file_path IN LISTS file_paths)
        get_filename_component(dir_path "${file_path}" DIRECTORY)
        
        file(REAL_PATH "${dir_path}" real_path BASE_DIRECTORY "${PROJECT_SOURCE_DIR}")
        
        file(RELATIVE_PATH rel_path "${PROJECT_SOURCE_DIR}" "${real_path}")
        
        string(REPLACE "/" "\\" group_name "${rel_path}")
        
        source_group("${group_name}" FILES "${file_path}")
    endforeach()
endfunction(group_target_sources_by_directory_structure)
