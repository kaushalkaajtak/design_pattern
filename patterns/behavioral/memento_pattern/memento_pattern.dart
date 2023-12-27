// Memento class
class Memento {
  final String? text;

  Memento({required this.text});
}

// History/Caretaker class
class CareTaker {
  CareTaker._();

  static final i = CareTaker._();
  List<Memento> states = [];

  void addState(Memento state) {
    print('--------save state---------');
    states.add(state);
  }

  Memento undo() {
    print('-------undo op--------');
    states.removeAt(states.length - 1);
    return states.last;
  }
}

// Originator class
class TextEditor {
  String? _text;
  CareTaker _careTaker = CareTaker.i;

  void setText(String text) {
    _text = text;
    _careTaker.addState(Memento(text: _text));
    print(_text);
  }

  String? getText() {
    print(_text);
    return _text;
  }

  void addText(String text) {
    _text = '${_text ?? ' '}${text}';
    _careTaker.addState(Memento(text: _text));
    print(_text);
  }

  void undo() {
    var state = _careTaker.undo();
    _text = state.text;
    print(_text);
  }
}

void main() {
  TextEditor editor = TextEditor();

  editor.setText('abc');
  editor.addText(' def');
  editor.addText(' ghi');
  editor.undo();
  editor.undo();
}
