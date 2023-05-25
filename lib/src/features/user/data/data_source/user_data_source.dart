abstract class UserDataSource {
  Future fetchUserList();

  Future fetchUserDetails(int userId);
}
