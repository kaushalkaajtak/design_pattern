// simply use copy with constructor

abstract class EmployeeProtype {
  EmployeeProtype clone();
}

class Employee extends EmployeeProtype {
  String name;
  String designation;

  Employee(this.name, this.designation);

  @override
  EmployeeProtype clone() {
    return Employee(name, designation);
  }

  @override
  String toString() {
    return 'Employee{name: $name, designation: $designation}';
  }
}

void clientRun() {
  // probably different prototypes can provide differnt copy logic.
  // or we can do it in the base class itself.
  Employee employee = Employee('john', 'developer');
  print(employee.toString());

  Employee employee2 = employee.clone() as Employee;
  employee2.name = 'jane';
  print(employee2.toString());
}

void main() {
  clientRun();
}
