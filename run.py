
import sys
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    current_dir = Path(__file__).parent.resolve()
    engine.addImportPath(str(current_dir))

    qml_file = current_dir / "main.qml"
    print(f"Loading QML from: {qml_file}")
    engine.load(str(qml_file))

    if not engine.rootObjects():
        print("ERROR: Failed to load QML")
        for error in engine.errors():
            print(f"  - {error.toString()}")
        sys.exit(-1)

    print("QML loaded successfully, window should appear...")
    sys.exit(app.exec())
