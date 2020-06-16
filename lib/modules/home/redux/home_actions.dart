import 'package:EKF/modules/home/models/child.dart';
import 'package:EKF/modules/home/models/employee.dart';

class AddEmployeeAction {
  Employee employee;

  AddEmployeeAction({this.employee});
}

class AddChildAction {
  Child child;

  AddChildAction({this.child});
}
