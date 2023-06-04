part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.status = Status.initial,
    this.message = '',
    this.productList = const <ProductModel>[],
    this.selectedProduct,
    this.addedStatus = Status.initial,
    this.updatedStatus = Status.initial,
    this.deletedStatus = Status.initial,
  });

  final Status status;
  final String message;
  final List<ProductModel> productList;
  final ProductModel? selectedProduct;
  final Status addedStatus;
  final Status updatedStatus;
  final Status deletedStatus;

  ProductState copyWith({
    Status? status,
    String? message,
    List<ProductModel>? productList,
    ProductModel? selectedProduct,
    Status? addedStatus,
    Status? updatedStatus,
    Status? deletedStatus,
  }) {
    return ProductState(
      status: status ?? this.status,
      message: message ?? this.message,
      productList: productList ?? this.productList,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      addedStatus: addedStatus ?? this.addedStatus,
      updatedStatus: updatedStatus ?? this.updatedStatus,
      deletedStatus: deletedStatus ?? this.deletedStatus,
    );
  }

  @override
  String toString() {
    return '''ProductState { 
      status: $status, 
      message: $message,
      productList: ${productList.length},
      selectedProduct: $selectedProduct,
      addedStatus: $addedStatus,
      updatedStatus: $updatedStatus,
      deletedStatus: $deletedStatus
    }''';
  }

  @override
  List<Object> get props => [
    status,
    message,
    productList,
    selectedProduct.toString(),
    addedStatus,
    updatedStatus,
    deletedStatus,
  ];
}
