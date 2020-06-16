import 'package:EKF/modules/home/redux/home_state.dart';
import 'package:flutter/material.dart';

class AppState {
  final HomeState home;

  AppState({@required this.home});

  factory AppState.initial() {
    return AppState(
      home: HomeState.initial(),
    );
  }

  AppState copyWith({HomeState home}) {
    return AppState(
      home: home ?? this.home,
    );
  }
}
