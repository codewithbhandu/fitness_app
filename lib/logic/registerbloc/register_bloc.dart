import 'package:bloc/bloc.dart';
import 'package:fitness_app/services/auth_services.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthServices _register = AuthServices();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterRequestedEvent>((event, emit) async{
       print("Registerrequested bloc");
      emit(RegisterLoading());

      final result = await _register.registerAccount(event.email, event.password, event.name, event.phone);
    if (result) {
     emit(RegisterSuccessful());
    } else {
     emit(RegisterFailure());
    }





     
    });
  }
}
