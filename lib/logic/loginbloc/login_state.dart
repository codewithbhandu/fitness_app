part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

 class  LoginLoading extends LoginState{}
 class  LoginSuccessful extends LoginState{}
 class  LoginFailure extends LoginState{}


