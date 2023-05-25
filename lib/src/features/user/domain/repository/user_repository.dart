import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUserList();

  Future<UserModel> getUserDetails(int userId);
}
