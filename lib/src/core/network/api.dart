class Api {
  static const String _baseUrl = 'https://fakestoreapi.com/';

  static String get login => '${_baseUrl}auth/login';
  static String get getProduct => '${_baseUrl}products';
  static String get getProductCategories => '${_baseUrl}products/categories';
}
