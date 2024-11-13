abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {}

class RegisterFailure extends AuthStates {
  final String error;
  RegisterFailure({required this.error});
}

class SignInSuccess extends AuthStates {}

class SignInFailure extends AuthStates {
  final String error;
  SignInFailure({required this.error});
}

class SignOutSuccess extends AuthStates {}

class SignOutFailure extends AuthStates {}

class ShowSnackBar extends AuthStates {}

class ShowPassswordSuccess extends AuthStates {}
