import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  const UserUseCase({required this.userRepository});

  Future<List<UserModel>> getUserList(Map<String, dynamic> params) async {
    return await userRepository.getUserList(params);
  }

  Future<UserModel> getUserDetails(int userId) async {
    return await userRepository.getUserDetails(userId);
  }

  Future<String> addUser(Map<String, dynamic> requestBody) async {
    return await userRepository.addUser(requestBody);
  }

  Future<String> updateUser(Map<String, dynamic> requestBody) async {
    return await userRepository.updateUser(requestBody);
  }

  Future<String> deleteUser(Map<String, dynamic> requestBody) async {
    return await userRepository.deleteUser(requestBody);
  }
}
