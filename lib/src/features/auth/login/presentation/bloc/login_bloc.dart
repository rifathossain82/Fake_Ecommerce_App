import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/core/utils/logger.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/domain/use_case/auth_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase useCase;

  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      var token = await useCase.authRepository.login(event.requestBody);
      final localStorage = sl<LocalStorage>();
      localStorage.saveData(key: LocalStorageKey.token, data: token);
      emit(LoginLoaded(token: token));
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(LoginError(message: '$e'));
    }
  }
}
