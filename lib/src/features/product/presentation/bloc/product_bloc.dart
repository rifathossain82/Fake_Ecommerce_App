import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/use_case/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;

  ProductBloc({required this.productUseCase}) : super(ProductInitial()) {
    on<ProductEvent>(_onProductEvent);
  }

  void _onProductEvent(ProductEvent event, Emitter emit) async {
    if (event is GetProductList) {
      try {
        emit(ProductLoading());
        var productList = await productUseCase.getProductList();
        emit(ProductLoaded(productList));
      } catch (e) {
        emit(ProductError('$e'));
      }
    } else if (event is GetCategoryWiseProduct) {
      try {
        emit(ProductLoading());
        var productList = await productUseCase.getCategoryWiseProduct(
          categoryName: event.categoryName,
        );
        emit(ProductLoaded(productList));
      } catch (e) {
        emit(ProductError('$e'));
      }
    }
  }
}
