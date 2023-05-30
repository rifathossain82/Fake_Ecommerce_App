part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> productList;

  const ProductLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

class ProductDetailsLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductDetailsLoaded extends ProductState {
  final ProductModel product;

  const ProductDetailsLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}

class ProductAddedSuccess extends ProductState {
  final String message;

  const ProductAddedSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ProductUpdatedSuccess extends ProductState {
  final String message;

  const ProductUpdatedSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ProductDeletedSuccess extends ProductState {
  final String message;

  const ProductDeletedSuccess(this.message);

  @override
  List<Object> get props => [message];
}
