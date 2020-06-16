import 'package:EKF/modules/home/models/child.dart';

class Employee {
  int id = 1;
  final String surname;
  final String name;
  final String patronymic;
  final String birthday;
  final String position;
  List<Child> children = [];

  Employee({
    this.id,
    this.surname,
    this.name,
    this.patronymic,
    this.birthday,
    this.position,
  });

  Map toMap() {
    return {
      'id': id,
      'surname': surname,
      'name': name,
      'patronymic': patronymic,
      'birthday': birthday,
      'position': position,
      'children': children,
    };
  }
}
