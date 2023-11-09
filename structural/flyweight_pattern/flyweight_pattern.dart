import 'dart:collection';

enum MilitaType { infantry, cavalry }

// main class
class Milita {
  final MilitaType type;

  // variable as game progresses
  int strength;
// constat value
  final MilitaProps militaProps;

  Milita(this.type, this.strength, {required this.militaProps});

  @override
  String toString() {
    return 'Milita{type: $type, MititaAtributes: $militaProps, strength : $strength}';
  }
}

// Flyweight (intrinsic state : constant one)
class MilitaProps {
  final String color;
  final String armour;
  final String weapon;

  MilitaProps(
      {required this.color, required this.armour, required this.weapon});

  @override
  String toString() {
    return 'MilitaProps{color: $color, armour: $armour, weapon: $weapon}';
  }
}

// flyweight factory
class MilitaPropsFactory {
  MilitaPropsFactory._internal();

  static final MilitaPropsFactory i = MilitaPropsFactory._internal();

  HashMap<MilitaType, MilitaProps> militaTypeMap = HashMap();

  MilitaProps getFlywighForType(MilitaType type) {
    if (!militaTypeMap.containsKey(type)) {
      MilitaProps props;
      switch (type) {
        case MilitaType.infantry:
          props = MilitaProps(
            color: 'red',
            armour: 'weak armour',
            weapon: 'long sword',
          );
          break;

        case MilitaType.cavalry:
          props = MilitaProps(
            color: 'blue',
            armour: 'strong armour',
            weapon: 'sword, bow and arrows',
          );
          break;
      }
      militaTypeMap[type] = props;
      print('CREATING $type');
    } else {
      print('REASUING $type');
    }
    return militaTypeMap[type]!;
  }
}

class Army {
  final List<Milita> listoFObjects = [];

  void addMilita(MilitaType type) {
    Milita baseClass =
        Milita(type, 100, militaProps: MilitaPropsFactory.i.getFlywighForType(type));

    listoFObjects.add(baseClass);
  }

  void showAllMilita() {
    print('total men at war ${listoFObjects.length}');
    listoFObjects.forEach((element) {
      print(element.toString());
    });
  }
}

void main() {
  var driver = Army();

  driver.addMilita(MilitaType.infantry);
  driver.addMilita(MilitaType.infantry);
  driver.addMilita(MilitaType.infantry);
  driver.addMilita(MilitaType.cavalry);
  driver.showAllMilita();
}
