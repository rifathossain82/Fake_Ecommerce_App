part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductList extends ProductEvent{
  @override
  List<Object?> get props => [];
}

class GetCategoryWiseProduct extends ProductEvent {
  final String categoryName;
  const GetCategoryWiseProduct({required this.categoryName});
  @override
  List<Object?> get props => [];
}