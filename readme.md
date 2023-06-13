# Alpakka Firmware

*Alpakka controller reference firmware (for Raspberry Pi Pico)*
## Project links
- [Alpakka Manual](https://inputlabs.io/devices/alpakka/manual).
- [Alpakka Firmware](https://github.com/inputlabs/alpakka_firmware). _(you are here)_
- [Alpakka PCB](https://github.com/inputlabs/alpakka_pcb).
- [Alpakka 3D-print](https://github.com/inputlabs/alpakka_case).
- [Input Labs Roadmap](https://github.com/orgs/inputlabs/projects/2/views/2).

## Supported developer operative systems
- GNU/Linux (and MacOS) - See [Development in Linux](https://inputlabs.io/devices/alpakka/manual/dev_unix).
- Windows - See [Development in Windows](https://inputlabs.io/devices/alpakka/manual/dev_windows).

## System dependencies
With `apt`, `rpm`, `pacman`, `brew`, or the equivalent package manager of your system, install:
- **gcc-arm-none-eabi**
- **libnewlib-arm-none-eabi**
- **libstdc++-arm-none-eabi-newlib**
- **git**
- **cmake**
- **make**

## Project dependencies
- `pico-sdk`: Either install locally according to the [official documentation](https://github.com/raspberrypi/pico-sdk#quick-start-your-own-project) or set `PICO_SDK_FETCH_FROM_GIT` as environment or cmake variable.

## Development configuration
- `cmake -B./build -G"Unix Makefiles"`: Generate a Makefile based project in the `build` directory

## Development commands
- `make`: Build compilation environment and build executables.
- `make load`: Load built .uf2 file into the Pico (requires bootsel mode or active session).
- `make reload`: Do a rebuild and then execute the `load` command (for dev convenience).
- `make clean`: Delete previous build files.
- `make session`: Connect to UART serial stdio, and display controller log.

While having an active session:
- `make restart`: Restart the controller.
- `make bootsel`: Put the controller in bootsel mode.
- `make calibrate`: Calibrate thumbstick and IMUs.
- `make format`: Format NVM sector and reset to initial values.
- `make test`: Start a semi-manual testing procedure for the buttons and axis.

## Devkit button
- Single press: Restart the controller.
- Double press: Put the controller in bootsel mode.

Read the [Alpakka developer manual](https://inputlabs.io/devices/alpakka/manual/dev) for details about the **devkit** and more.
