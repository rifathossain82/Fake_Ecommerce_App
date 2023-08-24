import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/utils/logger.dart';
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

  ProductBloc({required this.productUseCase}) : super(const ProductState()) {
    on<GetProductList>(_getProductList);
    on<GetProductDetails>(_getProductDetails);
    on<AddProduct>(_addProduct);
    on<UpdateProduct>(_updateProduct);
    on<DeleteProduct>(_deleteProduct);
  }

  void _getProductList(GetProductList event, Emitter<ProductState> emit) async {
    try {
      /// Check if the product list is already loaded
      if (!isProductListLoaded) {
        emit(state.copyWith(status: Status.loading));

        final Map<String, dynamic> params = {
          'limit': '$limit',
          'sort': '${selectedSorting?.name}',
        };

        var productList = await productUseCase.getProductList(params);

        /// Set the flag to indicate the product list is loaded
        isProductListLoaded = true;
        emit(
          state.copyWith(
            productList: productList,
            status: Status.success,
          ),
        );
      }
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(
        state.copyWith(
          status: Status.failure,
          message: '$e',
        ),
      );
    }
  }

  void _getProductDetails(
    GetProductDetails event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final ProductModel product = await productUseCase.getProductDetails(
        event.productId,
      );

      emit(
        state.copyWith(
          selectedProduct: product,
          status: Status.success,
        ),
      );
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(
        state.copyWith(
          status: Status.failure,
          message: '$e',
        ),
      );
    }
  }

  void _addProduct(AddProduct event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(addedStatus: Status.loading));
      var message = await productUseCase.addProduct(event.requestBody);
      emit(
        state.copyWith(
          addedStatus: Status.success,
          message: message,
        ),
      );
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(
        state.copyWith(
          addedStatus: Status.failure,
          message: '$e',
        ),
      );
    }
  }

  void _updateProduct(UpdateProduct event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(updatedStatus: Status.loading));
      var message = await productUseCase.updateProduct(event.requestBody);
      emit(
        state.copyWith(
          updatedStatus: Status.success,
          message: message,
        ),
      );
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(
        state.copyWith(
          updatedStatus: Status.failure,
          message: '$e',
        ),
      );
    }
  }

  void _deleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(deletedStatus: Status.loading));
      var message = await productUseCase.deleteProduct(event.productId);
      emit(
        state.copyWith(
          deletedStatus: Status.success,
          message: message,
        ),
      );
    } catch (e, straceTrace) {
      Log.error(
        e.toString(),
        stackTrace: straceTrace,
      );

      emit(
        state.copyWith(
          deletedStatus: Status.failure,
          message: '$e',
        ),
      );
    }
  }
}
