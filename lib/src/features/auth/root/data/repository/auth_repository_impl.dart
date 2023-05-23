
import 'package:fake_ecommerce_app/src/features/auth/root/data/data_source/auth_data_source.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  const AuthRepositoryImpl({required this.dataSource});

  @override
  Future<String> login(Map<String, dynamic> requestBody) async {
    return dataSource.login(requestBody) as String;
  }
}
