part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginRequestedEvent extends LoginEvent{
  String email;
  String password;
  LoginRequestedEvent({required this.email, required this.password});
}
