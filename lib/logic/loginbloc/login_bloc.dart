import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/services/auth_services.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    final AuthServices _login = AuthServices();
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestedEvent>((event, emit)async {
      print("Loginrequested bloc");
      emit(LoginLoading());
       
 final result = await _login.loginRequest(event.email, event.password);
    if (result) {
     emit(LoginSuccessful());
    } else {
      //byfgygutfydrtusrjdfghjbjh
     emit(LoginFailure());
    }

     

      
    });
  }
}
