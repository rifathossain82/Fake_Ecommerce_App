import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/domain/use_case/user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase useCase;
  bool isUserListLoaded = false;

  UserBloc({required this.useCase}) : super(UserInitial()) {
    on<UserEvent>(_onUserEvent);
  }

  void _onUserEvent(UserEvent event, Emitter emit) async {
    if (event is GetUserList) {
      try {
        if (!isUserListLoaded) {
          emit(UserLoading());
          final List<UserModel> userList = await useCase.getUserList();
          isUserListLoaded = true;
          emit(UserLoaded(userList: userList));
        }
      } catch (e) {
        emit(UserError(message: '$e'));
      }
    } else if (event is GetUserDetails) {
      try {
        if (!isUserListLoaded) {
          emit(UserLoading());
          final UserModel user = await useCase.getUserDetails(event.userId);
          emit(UserDetailsLoaded(user: user));
        }
      } catch (e) {
        emit(UserError(message: '$e'));
      }
    }
  }
}
