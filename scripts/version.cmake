if(NOT DEFINED VERSION_HEADER)
    message(FATAL_ERROR "\"VERSION_HEADER\" is not defined!")
endif()

if(DEFINED ENV{GITHUB_REF})
    set(TAG ENV{GITHUB_REF})
else()
    find_package(Git)
    if(NOT Git_FOUND)
        set(TAG "unknown")
    else()
        execute_process(COMMAND ${GIT_EXECUTABLE} describe --tags
                        OUTPUT_VARIABLE TAG
                        ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
        # If this is not a git repo (e.g. when extracted from a zip) then the TAG will be empty
        if("${TAG}" STREQUAL "")
            set(TAG "unknown")
        endif()
    endif()
endif()

set(VERSION "#pragma once\n\n#define VERSION \"${TAG}\"")

if(EXISTS ${VERSION_HEADER})
    file(READ ${VERSION_HEADER} VERSION_OLD)
else()
    set(VERSION_OLD "")
endif()

if (NOT "${VERSION}" STREQUAL "${VERSION_OLD}")
    file(WRITE ${VERSION_HEADER} "${VERSION}")
endif()