import 'package:fake_ecommerce_app/src/features/user/data/data_source/user_data_source.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  const UserRepositoryImpl({required this.dataSource});

  @override
  Future<List<UserModel>> getUserList(Map<String, dynamic> params) async {
    dynamic responseBody = await dataSource.fetchUserList(params);

    final List<UserModel> userList = [];
    if (responseBody != null) {
      for (var user in responseBody) {
        userList.add(UserModel.fromJson(user));
      }
    }

    return userList;
  }

  @override
  Future<UserModel> getUserDetails(int userId) async {
    dynamic responseBody = await dataSource.fetchUserDetails(userId);

    UserModel user = UserModel.fromJson(responseBody);
    return user;
  }

  @override
  Future<String> addUser(Map<String, dynamic> requestBody) async {
    await dataSource.addUser(requestBody);
    return 'User Added Successfully!';
  }

  @override
  Future<String> updateUser(Map<String, dynamic> requestBody) async {
    await dataSource.updateUser(requestBody);
    return 'User Updated Successfully!';
  }

  @override
  Future<String> deleteUser(Map<String, dynamic> requestBody) async {
    await dataSource.deleteUser(requestBody);
    return 'User Deleted Successfully!';
  }
}
