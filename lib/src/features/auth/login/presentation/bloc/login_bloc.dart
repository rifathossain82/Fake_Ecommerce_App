import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/domain/use_case/auth_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase useCase;
  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter emit) async {
    if (event is Login) {
      try {
        emit(LoginInitial());
        var token = await useCase.authRepository.login(event.requestBody);
        emit(LoginLoaded(token: token));
      } catch (e) {
        emit(LoginError(message: '$e'));
      }
    }
  }
}
