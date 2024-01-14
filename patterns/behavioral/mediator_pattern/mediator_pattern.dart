abstract interface class Mediator implements Subject {}

abstract class Component implements Observer {}

class UserName implements Component {
  String? name;
  final Mediator mediator;

  UserName({this.name, required this.mediator}) {
    mediator.addObserver(this);
  }

  void updateName(String name) {
    mediator.updateState(mediator.getState().copyWith(name: name));
  }

  @override
  void update(FormFieldState state) {
    name = state.name;
  }

  @override
  String toString() {
    return 'Text Box (name) : $name';
  }
}

class AcceptCheckBox implements Component {
  bool accepted = false;
  final Mediator mediator;

  AcceptCheckBox({required this.mediator}) {
    mediator.addObserver(this);
  }

  void toggleBox(bool tick) {
    mediator.updateState(mediator.getState().copyWith(ticked: tick));
  }

  @override
  void update(FormFieldState state) {
    accepted = state.checkBoxTicked;
  }

  @override
  String toString() {
    return 'Check Box : ${accepted ? "selected" : "unselected"}';
  }
}

class SaveButton implements Component {
  final Mediator mediator;
  bool active = false;

  SaveButton({required this.mediator}) {
    mediator.addObserver(this);
  }

  void clickSave(bool save) {}

  @override
  void update(FormFieldState state) {
    active = state.saveButtonActive;
  }

  @override
  String toString() {
    return 'Save button : ${active ? "active" : "inactive"}';
  }
}

class FormMediator implements Mediator {
  List<Observer> obs = [];

  FormFieldState state = FormFieldState();
  @override
  void addObserver(Observer ob) {
    obs.add(ob);
  }

  @override
  void removeObserver(Observer ob) {
    obs.remove(ob);
  }

  @override
  void updateObservers(FormFieldState state) {
    for (var ob in obs) {
      ob.update(state);
    }
  }

  @override
  void updateState(FormFieldState state) {
    if (state.name.isNotEmpty && state.checkBoxTicked) {
      this.state = state.copyWith(saveActive: true);
    } else {
      this.state = state.copyWith(saveActive: false);
    }

    updateObservers(this.state);
  }

  @override
  FormFieldState getState() {
    return state;
  }

  @override
  void getAllState() {
    for (var ob in obs) {
      print(ob.toString());
    }
    print('---------------------');
  }
}

// obserface interface
abstract interface class Observer {
  void update(FormFieldState state);
}

abstract interface class Subject {
  void addObserver(Observer ob);
  void removeObserver(Observer ob);
  void updateObservers(FormFieldState state);
  void updateState(FormFieldState state);
  FormFieldState getState();
  void getAllState();
}

// data class
class FormFieldState {
  final String name;
  final bool checkBoxTicked;
  final bool saveButtonActive;

  FormFieldState(
      {this.name = '',
      this.saveButtonActive = false,
      this.checkBoxTicked = false});

  FormFieldState copyWith({String? name, bool? ticked, bool? saveActive}) {
    return FormFieldState(
        name: name ?? this.name,
        saveButtonActive: saveActive ?? saveButtonActive,
        checkBoxTicked: ticked ?? checkBoxTicked);
  }

  @override
  String toString() {
    return 'name $name  checkbox ${checkBoxTicked ? "ticked" : "unticked"} save ${saveButtonActive ? "active" : "inactive"}';
  }
}

void main() {
  var mediator = FormMediator();
  var name = UserName(mediator: mediator);
  var checkBox = AcceptCheckBox(mediator: mediator);
  var saveButton = SaveButton(mediator: mediator);

  mediator.getAllState();
  name.updateName('Kaushal');
  checkBox.toggleBox(true);
  mediator.getAllState();
  checkBox.toggleBox(false);
  mediator.getAllState();
  checkBox.toggleBox(true);
  name.updateName('');
  mediator.getAllState();
}
