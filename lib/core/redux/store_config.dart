import 'package:EKF/core/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:EKF/core/redux/app_reducers.dart';

final store = Store<AppState>(
  appReducers,
  initialState: AppState.initial(),
  middleware: [LoggingMiddleware.printer()],
);
