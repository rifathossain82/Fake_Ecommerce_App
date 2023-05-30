import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/use_case/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;

  /// Track whether the product list has been loaded
  bool isProductListLoaded = false;

  String? limit;
  SortingType? selectedSorting;

  void updateLimit(String value) {
    limit = value;
  }

  void updateSorting(SortingType type) {
    selectedSorting = type;
  }

  void clearFiltering() {
    limit = null;
    selectedSorting = null;
  }

  ProductBloc({required this.productUseCase}) : super(ProductInitial()) {
    on<ProductEvent>(_onProductEvent);
  }

  void _onProductEvent(ProductEvent event, Emitter emit) async {
    if (event is GetProductList) {
      try {
        /// Check if the product list is already loaded
        if (!isProductListLoaded) {
          emit(ProductLoading());

          final Map<String, dynamic> params = {
            'limit': '$limit',
            'sort': '${selectedSorting?.name}',
          };

          var productList = await productUseCase.getProductList(params);

          /// Set the flag to indicate the product list is loaded
          isProductListLoaded = true;
          emit(ProductLoaded(productList));
        }
      } catch (e) {
        emit(ProductError('$e'));
      }
    } else if (event is GetProductDetails) {
      try {
        emit(ProductDetailsLoading());

        final ProductModel product = await productUseCase.getProductDetails(
          event.productId,
        );

        emit(ProductDetailsLoaded(product));
      } catch (e) {
        emit(ProductError('$e'));
      }
    } else if (event is GetCategoryWiseProduct) {
      try {
        emit(ProductLoading());

        final Map<String, dynamic> params = {
          'limit': '$limit',
          'sort': '${selectedSorting?.name}',
        };

        var productList = await productUseCase.getCategoryWiseProduct(
          categoryName: event.categoryName,
          params: params,
        );

        emit(ProductLoaded(productList));
      } catch (e) {
        emit(ProductError('$e'));
      }
    } else if (event is AddProduct) {
      try {
        emit(ProductLoading());
        var message = await productUseCase.addProduct(event.requestBody);
        emit(ProductAddedSuccess(message));
      } catch (e) {
        emit(ProductError('$e'));
      }
    } else if (event is UpdateProduct) {
      try {
        emit(ProductLoading());
        var message = await productUseCase.updateProduct(event.requestBody);
        emit(ProductUpdatedSuccess(message));
      } catch (e) {
        emit(ProductError('$e'));
      }
    } else if (event is DeleteProduct) {
      try {
        emit(ProductLoading());
        var message = await productUseCase.deleteProduct(event.productId);
        emit(ProductDeletedSuccess(message));
      } catch (e) {
        emit(ProductError('$e'));
      }
    }
  }
}
