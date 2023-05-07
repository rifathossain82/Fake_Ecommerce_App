class Api {
  static const String _baseUrl = 'http://www.apiserver.mydaybookk.com/api/v1/';

  static String getImageURL(endPoint) => 'https://2b51-103-132-218-248.ngrok-free.app/$endPoint';

  static String get login => '${_baseUrl}login';
  static String get register => '${_baseUrl}register';
  static String get logout => '${_baseUrl}logout';
  static String get userInfo => '${_baseUrl}user';
  static String get updateUserInfo => '${_baseUrl}profile-update';
  static String get businessList => '${_baseUrl}business/index';
  static String get businessCategoryList => '${_baseUrl}business/category-list';
  static String get businessTypeList => '${_baseUrl}business/type-list';
  static String get addBusiness => '${_baseUrl}business/store';
  static String get deleteBusiness => '${_baseUrl}business/delete';
  static String cashbookList(String id) => '${_baseUrl}book/index/$id';
  static String get addBook => '${_baseUrl}book/store';
  static String get updateBook => '${_baseUrl}book/update';
  static String get deleteBook => '${_baseUrl}book/delete';
  static String get forceDeleteBook => 'https://5a59-103-132-218-248.ngrok-free.app';
  static String bookTransaction(String id) => '${_baseUrl}bookTransaction/index/$id';
  static String get addBookTransaction => '${_baseUrl}bookTransaction/store';
  static String get updateBookTransaction => '${_baseUrl}bookTransaction/update';
  static String get deleteBookTransaction => '${_baseUrl}bookTransaction/delete';
  static String get contactTypeList => '${_baseUrl}contactType/index';
  static String get contactList => '${_baseUrl}bookContact/index';
  static String get addContact => '${_baseUrl}bookContact/store';
  static String get updateContact => '${_baseUrl}bookContact/update';
  static String get deleteContact => '${_baseUrl}bookContact/delete';
  static String transactionCategoryList(String businessId) => '${_baseUrl}transactionCategory/index/$businessId';
  static String get addTransactionCategory => '${_baseUrl}transactionCategory/store';
  static String get updateTransactionCategory => '${_baseUrl}transactionCategory/update';
  static String get deleteTransactionCategory => '${_baseUrl}transactionCategory/delete';
  static String get paymentMethodList => '${_baseUrl}PaymentMethod/index';
  static String get addPaymentMethod=> '${_baseUrl}PaymentMethod/store';
  static String get updatePaymentMethod => '${_baseUrl}PaymentMethod/update';
  static String get deletePaymentMethod => '${_baseUrl}PaymentMethod/delete';
}
