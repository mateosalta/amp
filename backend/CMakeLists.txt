include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(
    Ampbackend_SRCS
    modules/Amp/backend.cpp
    modules/Amp/mytype.cpp
)

# Make the unit test files visible on qtcreator
add_custom_target(Ampbackend_UNITTEST_QML_FILES ALL SOURCES "tests/unit/tst_mytype.qml")

add_library(Ampbackend MODULE
    ${Ampbackend_SRCS}
)

set_target_properties(Ampbackend PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY Amp)

qt5_use_modules(Ampbackend Gui Qml Quick)

# Copy qmldir file to build dir for running in QtCreator
add_custom_target(Ampbackend-qmldir ALL
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/modules/Amp/qmldir ${CMAKE_CURRENT_BINARY_DIR}/Amp
    DEPENDS ${QMLFILES}
)

# Install plugin file
install(TARGETS Ampbackend DESTINATION ${QT_IMPORTS_DIR}/Amp/)
install(FILES   modules/Amp/qmldir DESTINATION ${QT_IMPORTS_DIR}/Amp/)
