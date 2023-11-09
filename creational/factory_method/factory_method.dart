// ignore_for_file: avoid_print

abstract class Car {
  int wheels = 4;
  int doors = 4;
  int steeringWheel = 1;
  void drive();
}

// defines an interface for creating an object
// but let subclasses decide the configuration of object.
abstract class CarFactory {
  Car createCar();
}

void clientRun(CarFactory factory) {
  Car car = factory.createCar();
  car.drive();
}

void anotherClient(Car car) {
  car.drive();
}

void main() {
  // construction logic is deffered to factories/helper classes.
  // probably may need to do extra configurations in factories.
  clientRun(MaurutiFactory());
  clientRun(AudiFactory());

  // construction logic will be here
  anotherClient(Audi());
  anotherClient(Mauruti());
}

// concrete implementations

class Mauruti extends Car {
  @override
  void drive() {
    print('driving maruti car');
  }
}

class Audi extends Car {
  @override
  void drive() {
    print("driving audi car");
  }
}

// subclass
class AudiFactory extends CarFactory {
  @override
  Car createCar() {
    return Audi();
  }
}

// subclass
class MaurutiFactory extends CarFactory {
  @override
  Car createCar() {
    return Mauruti();
  }
}
