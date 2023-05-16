import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  static DashboardCubit get(context) => BlocProvider.of(context);

  int _bottomNavBarIndex = 1;

  int get bottomNavBarIndex => _bottomNavBarIndex;

  void updateBottomNavBarIndex(int index){
    emit(DashboardLoading());
    _bottomNavBarIndex = index;
    emit(DashboardGetState());
  }
}
