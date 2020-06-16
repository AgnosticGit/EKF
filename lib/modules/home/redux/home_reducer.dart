import 'package:EKF/modules/home/models/employee.dart';
import 'package:EKF/modules/home/redux/home_actions.dart';
import 'package:EKF/modules/home/redux/home_state.dart';
import 'package:redux/redux.dart';

final homeReducer = combineReducers<HomeState>(
  [
    TypedReducer<HomeState, AddEmployeeAction>(_addEmployeeAction),
    TypedReducer<HomeState, AddChildAction>(_addChildAction),
  ],
);

HomeState _addEmployeeAction(HomeState state, AddEmployeeAction action) {
  List<Employee> copyEmployees = List.from(state.employees);
  int length = copyEmployees.length;
  int lastEmployeeId = 1;

  if (length != 0) {
    lastEmployeeId = copyEmployees[length - 1].id + 1;
  }
  
  action.employee.id = lastEmployeeId;
  copyEmployees.add(action.employee);

  return state.copyWith(employees: copyEmployees);
}

HomeState _addChildAction(HomeState state, AddChildAction action) {
  List<Employee> copyEmployees = List.from(state.employees);
  
  Employee employee =
      copyEmployees.firstWhere((item) => item.id == action.child.parentId);
  employee.children.add(action.child);

  return state.copyWith(employees: copyEmployees);
}
