import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/use_case/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUseCase categoryUseCase;
  /// Track whether the category list has been loaded
  bool isCategoryListLoaded = false;
  CategoryBloc({required this.categoryUseCase}) : super(CategoryInitial()) {
    on<CategoryEvent>(_onCategoryEvent);
  }

  void _onCategoryEvent(CategoryEvent event, Emitter emit) async {
    if (event is GetCategoryList) {
      try {
        /// Check if the category list is already loaded
        if (!isCategoryListLoaded) {
          emit(CategoryLoading());
          var categoryList = await categoryUseCase.getCategoryList();
          /// Set the flag to indicate the category list is loaded
          isCategoryListLoaded = true;
          emit(CategoryLoaded(categoryList));
        }
      } catch (e) {
        emit(CategoryError('$e'));
      }
    }
  }
}
