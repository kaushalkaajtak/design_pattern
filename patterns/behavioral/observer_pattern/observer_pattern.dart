// base observer class
abstract class Observer {
  void update(Map<String, dynamic> data);
}

// base subject class
abstract class Subject {
  List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers(Map<String, dynamic> data) {
    for (var observer in _observers) {
      observer.update(data);
    }
  }
}

class UserSubject extends Subject {}

class UserObserver extends Observer {
  String? name;
  int? age;

  @override
  void update(Map<String, dynamic> data) {
    this.name = data['name'] ?? '';
    this.age = data['age'] ?? -1;
  }

  @override
  String toString() {
    return 'name $name age $age';
  }
}

void main() {
  var userSubject = UserSubject();

  var userObs1 = UserObserver();
  var userObs2 = UserObserver();

  userSubject.addObserver(userObs1);
  userSubject.addObserver(userObs2);

  print(
      'initial setup of observers | count : ${userSubject._observers.length}');

  print('instance 1 | $userObs1');
  print('instance 2 | $userObs2');

  userSubject.notifyObservers({"name": "userName", "age": 20});

  print('upon updating instance 1 | $userObs1');
  print('upon updating instance 2 | $userObs2');
}
