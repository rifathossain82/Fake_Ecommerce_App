import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/use_case/category_use_case.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUseCase categoryUseCase;
  CategoryBloc({required this.categoryUseCase}) : super(CategoryInitial()) {
    on<CategoryEvent>(_onCategoryEvent);
  }

  void _onCategoryEvent(CategoryEvent event, Emitter emit) async {
    if (event is GetCategoryList) {
      try {
        emit(CategoryLoading());
        var categoryList = await categoryUseCase.getCategoryList();
        emit(CategoryLoaded(categoryList));
      } catch (e) {
        emit(CategoryError('$e'));
      }
    } else if (event is GetCategoryWiseProduct) {
      try {
        emit(CategoryLoading());
        var productList = await categoryUseCase.getCategoryWiseProduct(categoryName: event.categoryName);
        emit(CategoryWiseProductLoaded(productList));
      } catch (e) {
        emit(CategoryError('$e'));
      }
    }
  }
}
