set(SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/bus.c
    ${CMAKE_CURRENT_SOURCE_DIR}/button.c
    ${CMAKE_CURRENT_SOURCE_DIR}/config.c
    ${CMAKE_CURRENT_SOURCE_DIR}/dhat.c
    ${CMAKE_CURRENT_SOURCE_DIR}/gyro.c
    ${CMAKE_CURRENT_SOURCE_DIR}/helper.c
    ${CMAKE_CURRENT_SOURCE_DIR}/hid.c
    ${CMAKE_CURRENT_SOURCE_DIR}/imu.c
    ${CMAKE_CURRENT_SOURCE_DIR}/led.c
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/nvm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profile.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/console_legacy.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/console.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/desktop.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/fps_fusion.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/fps_wasd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/home.c
    ${CMAKE_CURRENT_SOURCE_DIR}/profiles/none.c
    ${CMAKE_CURRENT_SOURCE_DIR}/self_test.c
    ${CMAKE_CURRENT_SOURCE_DIR}/rotary.c
    ${CMAKE_CURRENT_SOURCE_DIR}/thumbstick.c
    ${CMAKE_CURRENT_SOURCE_DIR}/touch.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tusb_config.c
    ${CMAKE_CURRENT_SOURCE_DIR}/uart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/xinput.c
)

set(INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/headers
)

target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${SOURCE_FILES})
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${INCLUDE_DIRS})