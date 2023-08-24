import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/core/utils/logger.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/use_case/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUseCase categoryUseCase;

  /// Track whether the category list has been loaded
  bool isCategoryListLoaded = false;

  CategoryBloc({required this.categoryUseCase}) : super(CategoryInitial()) {
    on<GetCategoryList>(_getCategoryList);
  }

  void _getCategoryList(
    GetCategoryList event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      /// Check if the category list is already loaded
      if (!isCategoryListLoaded) {
        emit(CategoryLoading());
        var categoryList = await categoryUseCase.getCategoryList();

        /// Set the flag to indicate the category list is loaded
        isCategoryListLoaded = true;
        emit(CategoryLoaded(categoryList));
      }
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(CategoryError('$e'));
    }
  }
}
