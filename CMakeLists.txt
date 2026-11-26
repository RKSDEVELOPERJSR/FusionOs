cmake_minimum_required(VERSION 3.16)
project(FusionOS LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(FusionOS main.cpp)

qt_add_qml_module(FusionOS
    URI FusionOS
    VERSION 1.0
    QML_FILES Main.qml
)

target_link_libraries(FusionOS PRIVATE Qt6::Quick)
