import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  const UserUseCase({required this.userRepository});

  Future<List<UserModel>> getUserList() async {
    return await userRepository.getUserList();
  }

  Future<UserModel> getUserDetails(int userId) async {
    return await userRepository.getUserDetails(userId);
  }
}
