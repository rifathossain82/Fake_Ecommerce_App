
import 'package:fake_ecommerce_app/src/features/auth/root/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  const AuthUseCase({required this.authRepository});

  Future<String> login(Map<String, dynamic> requestBody) async{
    return await authRepository.login(requestBody);
  }
}
