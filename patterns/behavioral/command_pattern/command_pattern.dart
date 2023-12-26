// command class
abstract class Command {
  void execute();
  void undo();
}

// receiver
class TextEditor {
  String _text = '';

  void setText(String text) {
    this._text = text;
    print('$_text');
  }

  String getText() {
    return _text;
  }

  void insertText(String text) {
    this._text += text;
    print('$_text');
  }

  void removeText(String text) {
    _text.replaceAll(text, '');
    print('$_text');
  }
}

// Sender
class TextUI {
  Command? _command;

  void setCommand(Command command) {
    _command = command;
  }

  void execute() {
    print('execute $_command');
    _command?.execute();
  }

  void undo() {
    print('undo $_command');
    _command?.undo();
  }
}

// concrete implementations
class CutCommand implements Command {
  String text = '';
  final TextEditor _editor;

  CutCommand({required TextEditor editor}) : _editor = editor;
  @override
  void execute() {
    this.text = _editor.getText();
    _editor.setText('');
  }

  @override
  void undo() {
    _editor.insertText(text);
    text = '';
  }
}

class PasteCommand implements Command {
  String text;
  final TextEditor _editor;

  String olderText = '';

  PasteCommand({required TextEditor editor, required this.text})
      : _editor = editor;
  @override
  void execute() {
    olderText = _editor.getText();
    _editor.insertText(text);
  }

  @override
  void undo() {
    _editor.setText(olderText);
  }
}

void main() {
  TextUI textUI = TextUI();
  final textEditor = TextEditor();

  textUI.setCommand(PasteCommand(editor: textEditor, text: 'Paste this text'));
  textUI.execute();
  textUI.setCommand(CutCommand(editor: textEditor));
  textUI.execute();
  textUI.undo();
}
