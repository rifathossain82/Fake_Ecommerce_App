import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/cubits/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int _sliderIndex = 0;

  int get sliderIndex => _sliderIndex;

  void updateSliderIndex(int index){
    emit(OnBoardingLoading());
    _sliderIndex = index;
    emit(OnBoardingGetState());
  }
}
