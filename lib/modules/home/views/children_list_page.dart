import 'package:EKF/core/redux/app_state.dart';
import 'package:EKF/modules/home/models/child.dart';
import 'package:EKF/modules/home/redux/home_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ChildrenListPage extends StatelessWidget {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  Widget build(BuildContext context) {
    int parentId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Дети')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
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
                    decoration: const InputDecoration(
                      hintText: 'Дата рождения',
                    ),
                  ),
                  StoreConnector<AppState, VoidCallback>(
                    converter: (store) {
                      return () => store.dispatch(
                            AddChildAction(
                              child: Child(
                                parentId: parentId,
                                surname: _surnameController.text,
                                name: _nameController.text,
                                patronymic: _patronymicController.text,
                                birthday: _birthdayController.text,
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
          ),
          Expanded(
            child: StoreConnector<AppState, List<Child>>(
              converter: (store) => store.state.home.employees
                  .firstWhere((element) => element.id == parentId)
                  .children,
              builder: (BuildContext context, List<Child> children) {
                return ListView.builder(
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    return _buildChildListItem(
                      surname: children[index].surname,
                      name: children[index].name,
                      patronymic: children[index].patronymic,
                      birthday: children[index].birthday,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildListItem({
    String surname,
    String name,
    String patronymic,
    String birthday,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.orange)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ],
      ),
    );
  }
}
