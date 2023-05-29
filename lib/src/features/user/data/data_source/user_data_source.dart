abstract class UserDataSource {
  Future fetchUserList(Map<String, dynamic> params);

  Future fetchUserDetails(int userId);

  Future addUser(Map<String, dynamic> requestBody);

  Future updateUser(Map<String, dynamic> requestBody);

  Future deleteUser(Map<String, dynamic> requestBody);
}
