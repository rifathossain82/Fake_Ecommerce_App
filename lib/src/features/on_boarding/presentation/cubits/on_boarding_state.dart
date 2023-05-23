import 'package:equatable/equatable.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();
}

class OnBoardingInitial extends OnBoardingState {
  @override
  List<Object> get props => [];
}

class OnBoardingLoading extends OnBoardingState {
  @override
  List<Object?> get props => [];
}

class OnBoardingGetState extends OnBoardingState {
  @override
  List<Object?> get props => [];
}
