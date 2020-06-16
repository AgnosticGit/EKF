import 'package:EKF/core/redux/app_state.dart';
import 'package:EKF/modules/home/redux/home_reducer.dart';

AppState appReducers(AppState state, dynamic action) {
  return AppState(
    home: homeReducer(state.home, action),
  );
}
