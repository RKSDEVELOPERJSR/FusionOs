# Fusion OS

Fusion OS is a conceptual multi-platform desktop shell designed on a Linux host to unify **Linux**, **Android**, **Windows**, and **macOS** application environments under a single adaptive UI (switching seamlessly between Windows-style taskbar and macOS-style dock layouts).

## Project Structure
- `Main.qml`: Adaptive Qt/QML UI shell with layout switcher and multi-OS app launchers.
- `main.cpp`: C++ entry point loading the QML engine.
- `CMakeLists.txt`: CMake build configuration for Qt 6.5+.
- `README.md`: Project setup and build instructions.

## Build Requirements
- Qt 6.5 or higher (`Qt6::Quick`)
- CMake 3.16+
- C++17 compatible compiler (GCC/Clang)
- Wayland compositor (for Linux host)

## Compilation & Run
```bash
mkdir build && cd build
cmake ..
make
./FusionOS
```
