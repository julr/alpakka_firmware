# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2022, Input Labs Oy.

cmake_minimum_required(VERSION 3.16)

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

add_subdirectory(src)