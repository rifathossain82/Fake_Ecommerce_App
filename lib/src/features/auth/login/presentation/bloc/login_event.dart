part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent {
  final Map<String, dynamic> requestBody;

  const Login({required this.requestBody});

  @override
  List<Object?> get props => [requestBody];
}
