class Api {
  static const String _baseUrl = 'https://fakestoreapi.com/';

  static String get login => '${_baseUrl}auth/login';
  static String get getProduct => '${_baseUrl}products';
  static String get getProductCategories => '${_baseUrl}products/categories';
  static String getCategoryWiseProduct(String categoryName) => '${_baseUrl}products/category/$categoryName';
  static String get getUsers => '${_baseUrl}users';
  static String getUserDetails(int id) => '${_baseUrl}users/$id';
  static String get adduser => '${_baseUrl}users';
  static String updateUser(int id) => '${_baseUrl}users/$id';
  static String deleteUser(int id) => '${_baseUrl}users/$id';
}
