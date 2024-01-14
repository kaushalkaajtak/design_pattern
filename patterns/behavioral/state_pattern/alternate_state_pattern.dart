// State blueprint
abstract interface class State {
  void performOP();
}

class EditorState implements State {
  @override
  void performOP() {
    print('editor state');
  }
}

class PdfState implements State {
  @override
  void performOP() {
    print('show in pdf');
  }
}

// Context
class PrinterState implements State {
  @override
  void performOP() {
    print('print to page');
  }
}

class DocumentContext {
  State _state;

  DocumentContext({required State initialState}) : _state = initialState;

  void changeState(State state) {
    _state = state;
  }

  void performOP() {
    _state.performOP();
  }
}

void main() {
  var doc = DocumentContext(initialState: EditorState());
  doc.performOP();

  doc.changeState(PdfState());
  doc.performOP();

  doc.changeState(PrinterState());
  doc.performOP();
}
