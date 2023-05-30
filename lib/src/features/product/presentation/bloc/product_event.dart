part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductList extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class GetProductDetails extends ProductEvent {
  final int productId;
  const GetProductDetails({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class GetCategoryWiseProduct extends ProductEvent {
  final String categoryName;

  const GetCategoryWiseProduct({required this.categoryName});

  @override
  List<Object?> get props => [];
}

class AddProduct extends ProductEvent {
  final Map<String, dynamic> requestBody;

  const AddProduct({required this.requestBody});

  @override
  List<Object?> get props => [requestBody];
}

class UpdateProduct extends ProductEvent {
  final Map<String, dynamic> requestBody;

  const UpdateProduct({required this.requestBody});

  @override
  List<Object?> get props => [requestBody];
}

class DeleteProduct extends ProductEvent {
  final int productId;

  const DeleteProduct({required this.productId});

  @override
  List<Object?> get props => [productId];
}
