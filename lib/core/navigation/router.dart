import 'package:EKF/modules/home/views/add_employee_page.dart';
import 'package:EKF/modules/home/views/children_list_page.dart';
import 'package:EKF/modules/home/views/employee_list_page.dart';
import 'package:flutter/material.dart';

class Router {
  static final Map<String, StatelessWidget Function(BuildContext context)>
      routes = {
    'HomePage': (BuildContext context) => EmployeeListPage(),
    'AddEmployeePage': (BuildContext context) => AddEmployeePage(),
    'ChildrenListPage': (BuildContext context) => ChildrenListPage()
  };
}
