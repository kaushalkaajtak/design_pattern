// abstract products
abstract class Engine {
  void createEngine();
}

abstract class Wheels {
  void createWheels();
}

// abstract factory
abstract class Factory {
  Engine createEngine();
  Wheels createWheels();
}

void clientCreateParts(Factory factory) {
  factory.createEngine();
  factory.createWheels();
}

void main() {
  clientCreateParts(MarutiFactory());
  clientCreateParts(AudiFactory());
}

// concrete products
class AudiEngine implements Engine {
  @override
  void createEngine() {
    print('create audi engine');
  }
}

class MaurutiEngine implements Engine {
  @override
  void createEngine() {
    print('create mauruti engine');
  }
}

class AudiWheels implements Wheels {
  @override
  void createWheels() {
    print('create audi wheels');
  }
}

class MaurutiWheels implements Wheels {
  @override
  void createWheels() {
    print('create mauruti wheels');
  }
}

// concrete factory
class MarutiFactory extends Factory {
  @override
  Engine createEngine() => MaurutiEngine()..createEngine();

  @override
  Wheels createWheels() => MaurutiWheels()..createWheels();
}

class AudiFactory extends Factory {
  @override
  Engine createEngine() => AudiEngine()..createEngine();

  @override
  Wheels createWheels() => AudiWheels()..createWheels();
}
