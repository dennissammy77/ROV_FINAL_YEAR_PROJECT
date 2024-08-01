import sys
# import QApplication and all other widgets
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import (
    QApplication,
    QDialog,
    QDialogButtonBox,
    QFormLayout,
    QLineEdit,
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QLabel,
    QGridLayout,
    QMainWindow,
    QPushButton,
)

class Window(QWidget):
    # Create your application's GUI
    def __init__(self):
        super().__init__(parent=None)
        self.generalLayout = QVBoxLayout()
        self._CreateWindow()
        self._SensorDisplay()
        self._CreateControlButton()
        self._ButtonLayout()
        self.setLayout(self.generalLayout)

    def _CreateWindow(self):
        self.setWindowTitle("ROV GUI")
        self.setGeometry(100, 100, 400, 400)

    def _SensorDisplay(self):
        grid_layout = QGridLayout()
        DISPLAY_HEIGHT = 80
        self.display = QLineEdit()
        self.display.setFixedHeight(DISPLAY_HEIGHT)
        self.display.setAlignment(Qt.AlignmentFlag.AlignRight)
        self.display.setReadOnly(True)
        self.generalLayout.addWidget(self.display)

        container = QWidget()
        container.setLayout(grid_layout)
        container.setFixedSize(300, 300)

        v_layout = QVBoxLayout()
        v_layout.addStretch(1)
        v_layout.addWidget(container, 0, Qt.AlignmentFlag.AlignRight)


    def _CreateControlButton(self):
        self.buttonUp = QPushButton('Up', self)
        self.buttonDown = QPushButton('Down', self)
        self.buttonLeft = QPushButton('Left', self)
        self.buttonRight = QPushButton('Right', self)
        
        # Set the minimum size for each button
        BUTTON_SIZE = 80
        self.buttonUp.setMinimumSize(BUTTON_SIZE, BUTTON_SIZE)
        self.buttonDown.setMinimumSize(BUTTON_SIZE, BUTTON_SIZE)
        self.buttonLeft.setMinimumSize(BUTTON_SIZE, BUTTON_SIZE)
        self.buttonRight.setMinimumSize(BUTTON_SIZE, BUTTON_SIZE)


    def _ButtonLayout(self):
        grid_layout = QGridLayout()
        grid_layout.addWidget(self.buttonUp, 0, 1)
        grid_layout.addWidget(self.buttonDown, 2, 1)
        grid_layout.addWidget(self.buttonLeft, 1, 0)
        grid_layout.addWidget(self.buttonRight, 1, 2)

        container = QWidget()
        container.setLayout(grid_layout)
        container.setFixedSize(300, 300)

        v_layout = QVBoxLayout()
        v_layout.addStretch(1)
        v_layout.addWidget(container, 0, Qt.AlignmentFlag.AlignRight)
        # Add the final layout to the general layout
        self.generalLayout.addLayout(v_layout)
    
      
def main():
    # Create the instnce of QApplication
    app = QApplication([])
    window = Window()
    window.show()
    sys.exit(app.exec())

if __name__ == "__main__":
    main()
