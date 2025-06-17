part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterRequestedEvent extends RegisterEvent{
  String email;
  String password;
  String name;
  String phone;
  
RegisterRequestedEvent({required this.email, required this.password, required this.name, required this.phone });

}
