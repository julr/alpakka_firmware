# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2022, Input Labs Oy.

cmake_minimum_required(VERSION 3.16)

# Disable in-source builds to prevent source tree corruption.
if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR
    "In-source builds are not allowed!
    Please create a directory and run cmake from there, passing the path to this source directory as the last argument.
    This process created the file `CMakeCache.txt' and the directory `CMakeFiles', please delete them.")
endif()

if (EXISTS ./deps/pico-sdk AND EXISTS ./deps/arm-toolchain)
    # If the dependencies are local.
    set(PICO_SDK_PATH ./deps/pico-sdk)
    set(PICO_TOOLCHAIN_PATH ./deps/arm-toolchain)
    include(${PICO_SDK_PATH}/pico_sdk_init.cmake)
else()
    # If the dependencies are global.
    include(scripts/pico_sdk_import.cmake)
endif()

project(alpakka C CXX ASM)

pico_sdk_init()

add_executable(${CMAKE_PROJECT_NAME})

target_link_libraries(${CMAKE_PROJECT_NAME}
    pico_stdlib
    pico_multicore
    pico_time
    pico_unique_id
    pico_bootrom
    pico_bootsel_via_double_reset
    hardware_adc
    hardware_flash
    hardware_i2c
    hardware_pwm
    hardware_spi
    hardware_sync
    hardware_timer
    tinyusb_device
)

pico_enable_stdio_uart(${CMAKE_PROJECT_NAME} 1)
pico_add_extra_outputs(${CMAKE_PROJECT_NAME})

add_custom_target(version
    COMMAND ${CMAKE_COMMAND} -DVERSION_HEADER=${CMAKE_SOURCE_DIR}/src/headers/version.h -P ${CMAKE_SOURCE_DIR}/scripts/version.cmake
)

add_dependencies(${CMAKE_PROJECT_NAME} version)

add_subdirectory(src)