abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class GetUserProfileLoading extends ProfileStates {}

class GetUserProfileSuccess extends ProfileStates {}

class GetUserProfileError extends ProfileStates {
  final String error;
  GetUserProfileError({required this.error});
}
