part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthActionState extends AuthState{}

final class AuthInitial extends AuthState {}

class LogginLoadedState extends AuthActionState{}

class RegisterPageNavigateState extends AuthActionState{
}

class LoginPageNavigatedState extends AuthActionState{}

class LoggedInSuccessState extends AuthActionState{}

class LoggedInErrorState extends AuthActionState{
  final String message;
  LoggedInErrorState({required this.message});

}

class RegisterSuccessState extends AuthActionState{
}

class RegisterErrorState extends AuthActionState{
  final String message;
  RegisterErrorState({required this.message});
}

