abstract class AuthDataSource{
  Future login(Map<String, dynamic> requestBody);

  Future signUp(Map<String, dynamic> requestBody);

  Future forgotPassword(Map<String, dynamic> requestBody);

  Future forgotPasswordUpdate(Map<String, dynamic> requestBody);

  Future changePassword(Map<String, dynamic> requestBody);

  Future logout(Map<String, dynamic> requestBody);
}