import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUserList(Map<String, dynamic> params);

  Future<UserModel> getUserDetails(int userId);

  Future<String> addUser(Map<String, dynamic> requestBody);

  Future<String> updateUser(Map<String, dynamic> requestBody);

  Future<String> deleteUser(Map<String, dynamic> requestBody);
}
