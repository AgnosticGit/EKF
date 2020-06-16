class HomeState {
  final List employees;

  HomeState({this.employees});

  factory HomeState.initial() {
    return HomeState(employees: []);
  }

  HomeState copyWith({List employees}) {
    return HomeState(
      employees: employees ?? this.employees,
    );
  }
}
