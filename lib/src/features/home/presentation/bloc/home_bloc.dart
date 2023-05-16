import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/use_case/home_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc({required this.homeUseCase}) : super(HomeInitial()) {
    on<HomeEvent>(_onHomeEvent);
  }

  void _onHomeEvent(HomeEvent event, Emitter emit) async {
    if (event is GetProductList) {
      try {
        emit(HomeLoading());
        var productList = await homeUseCase.getProductList();
        emit(HomeLoaded(productList));
      } catch (e) {
        emit(HomeError('$e'));
      }
    }
  }
}
