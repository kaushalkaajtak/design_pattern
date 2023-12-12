class Singlton {
  Singlton._internal();
  static final Singlton _instance = Singlton._internal();
  factory Singlton() => _instance;
}

void clientCode() {
  Singlton instance = Singlton();
  print(instance.hashCode);
  Singlton instance2 = Singlton();
  print(instance2.hashCode);
  print(instance == instance2);
}

void main() {
  clientCode();
}
