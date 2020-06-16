import 'package:EKF/core/redux/app_state.dart';
import 'package:EKF/modules/home/redux/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EmployeeListPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сотрудники')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, 'AddEmployeePage'),
        label: Text('Добавить сотрудника'),
      ),
      body: StoreConnector<AppState, HomeState>(
        converter: (store) => store.state.home,
        builder: (BuildContext context, HomeState home) {
          return ListView.builder(
            itemCount: home.employees.length,
            itemBuilder: (context, index) {
              Map item = home.employees[index].toMap();
              return _buildEmployeeListItem(
                context: context,
                id: item['id'],
                surname: item['surname'],
                name: item['name'],
                patronymic: item['patronymic'],
                birthday: item['birthday'],
                position: item['position'],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmployeeListItem({
    BuildContext context,
    int id,
    String surname,
    String name,
    String patronymic,
    String birthday,
    String position,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        'ChildrenListPage',
        arguments: id,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.orange)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Фамилия:', style: TextStyle(color: Colors.blue)),
                Text(surname),
                Text('Имя:', style: TextStyle(color: Colors.blue)),
                Text(name),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Отчество:', style: TextStyle(color: Colors.blue)),
                Text(patronymic),
                Text('День рождения:', style: TextStyle(color: Colors.blue)),
                Text(birthday),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Должность:', style: TextStyle(color: Colors.blue)),
                Text(position),
              ],
            )
          ],
        ),
      ),
    );
  }
}
