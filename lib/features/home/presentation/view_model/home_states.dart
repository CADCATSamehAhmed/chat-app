abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class LogOutLoading extends HomeStates {}

class ChangeBottomNavigationBarIndex extends HomeStates {}

class LogOutSuccess extends HomeStates {}

class LogOutError extends HomeStates {
  final String error;
  LogOutError({required this.error});
}
