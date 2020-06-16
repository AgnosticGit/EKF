import 'package:EKF/core/redux/app_state.dart';
import 'package:EKF/modules/home/models/employee.dart';
import 'package:EKF/modules/home/redux/home_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddEmployeePage extends StatelessWidget {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить сотрудника')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(hintText: 'Фамилия'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Имя'),
            ),
            TextField(
              controller: _patronymicController,
              decoration: const InputDecoration(hintText: 'Отчество'),
            ),
            TextField(
              controller: _birthdayController,
              decoration: const InputDecoration(hintText: 'Дата рождения'),
            ),
            TextField(
              controller: _positionController,
              decoration: const InputDecoration(hintText: 'Должность'),
            ),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(
                      AddEmployeeAction(
                        employee: Employee(
                          surname: _surnameController.text,
                          name: _nameController.text,
                          patronymic: _patronymicController.text,
                          birthday: _birthdayController.text,
                          position: _positionController.text,
                        ),
                      ),
                    );
              },
              builder: (context, action) {
                return RaisedButton(
                  color: Colors.orange,
                  onPressed: action,
                  child: Text('Добавить'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
