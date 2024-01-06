import 'parent.dart';

class Child implements Parent {
  // cant override
  void accesMehtod() {
    print(Parent.a);
  }
}

void main() {
  Parent.a;
  Parent.someMethod();
  // cant access
  // Child.s;
  // Child.someMethod;
}
