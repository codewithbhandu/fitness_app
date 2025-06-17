part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState{}
class RegisterSuccessful extends RegisterState{}
class RegisterFailure extends RegisterState{}


