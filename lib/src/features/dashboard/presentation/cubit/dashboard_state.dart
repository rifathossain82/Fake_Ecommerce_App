import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoading extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardGetState extends DashboardState {
  @override
  List<Object?> get props => [];
}
