part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginPageNavigateEvent extends AuthEvent{}

//event on signup button clicked on login page
class LoginPageSignupButtonClickedEvent extends AuthEvent{}
  


class LoginButtonClickedEvent extends AuthEvent{
  final String email;
  final String password;
  LoginButtonClickedEvent({required this.email, required this.password});
}

class RegisterButtonClickedEvent extends AuthEvent{
  final String userName;
  final String email;
  final String age;
  final String phone;
  final String password;
  RegisterButtonClickedEvent({required this.userName, required this.email, required this.age, required this.phone, required this.password});

}
