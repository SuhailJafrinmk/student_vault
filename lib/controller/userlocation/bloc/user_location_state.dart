part of 'user_location_bloc.dart';

@immutable
sealed class UserLocationState {}

class UserLocationInitial extends UserLocationState {}

class UserLocationLoadingState extends UserLocationState{}

class UserLocationErrorState extends UserLocationState{}

class UserLocationSuccessState extends UserLocationState{}