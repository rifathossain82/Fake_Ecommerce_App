part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoryList extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoryWiseProduct extends CategoryEvent {
  final String categoryName;
  const GetCategoryWiseProduct({required this.categoryName});
  @override
  List<Object?> get props => [];
}
