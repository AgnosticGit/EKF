import 'package:EKF/core/redux/app_state.dart';
import 'package:EKF/modules/home/views/employee_list_page.dart';
import 'package:EKF/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'core/redux/store_config.dart';

void main() {
  runApp(App(store: store));
}

class App extends StatelessWidget {
  final Store<AppState> store;

  App({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Router.routes,
        home: EmployeeListPage(),
      ),
    );
  }
}
