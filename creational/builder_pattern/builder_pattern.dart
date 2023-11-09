class Person {
  final String name;
  final int age;
  final int id;

  Person({required this.name, required this.age, required this.id});
}

class PersonBuilder {
  String name = '';
  int age = 0;
  int id = 123;
  PersonBuilder._();
  static final i = PersonBuilder._();

  Person build() {
    return Person(name: name, age: age, id: id);
  }
}

void clientCode(PersonBuilder personBuilder) {
  // helps in creating objects with optional values and with different configurations.
  // as it provides the default values to those and helps
  // in creating objects setp by step.

  personBuilder.name = 'John';
  personBuilder.age = 30;

  Person person = personBuilder.build();

  print(person.hashCode);

  print(person.name);
  print(person.age);

  personBuilder.name = 'Jane';
  var jane = personBuilder.build();

  print(jane.hashCode);

  print(jane.name);
  print(jane.age);
}

void main() {
  clientCode(PersonBuilder.i);
}
