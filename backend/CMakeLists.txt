include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(
    Lovebackend_SRCS
    modules/Love/backend.cpp
    modules/Love/mytype.cpp
)

# Make the unit test files visible on qtcreator
add_custom_target(Lovebackend_UNITTEST_QML_FILES ALL SOURCES "tests/unit/tst_mytype.qml")

add_library(Lovebackend MODULE
    ${Lovebackend_SRCS}
)

set_target_properties(Lovebackend PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY Love)

qt5_use_modules(Lovebackend Gui Qml Quick)

# Copy qmldir file to build dir for running in QtCreator
add_custom_target(Lovebackend-qmldir ALL
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/modules/Love/qmldir ${CMAKE_CURRENT_BINARY_DIR}/Love
    DEPENDS ${QMLFILES}
)

# Install plugin file
install(TARGETS Lovebackend DESTINATION ${QT_IMPORTS_DIR}/Love/)
install(FILES   modules/Love/qmldir DESTINATION ${QT_IMPORTS_DIR}/Love/)
