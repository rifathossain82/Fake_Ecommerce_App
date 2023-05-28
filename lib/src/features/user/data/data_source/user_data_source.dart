abstract class UserDataSource {
  Future fetchUserList();

  Future fetchUserDetails(int userId);

  Future addUser(Map<String, dynamic> requestBody);

  Future updateUser(Map<String, dynamic> requestBody);

  Future deleteUser(Map<String, dynamic> requestBody);
}
