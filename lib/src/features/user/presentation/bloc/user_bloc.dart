import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/utils/logger.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/domain/use_case/user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase useCase;

  bool isUserListLoaded = false;

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

  void reloadUserList() {
    isUserListLoaded = false;
    add(GetUserList());
  }

  UserBloc({required this.useCase}) : super(const UserState()) {
    on<GetUserList>(_getUserList);
    on<GetUserDetails>(_getUserDetails);
    on<AddNewUser>(_addNewUser);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  void _getUserList(GetUserList event, Emitter<UserState> emit) async {
    try {
      if (!isUserListLoaded) {
        emit(state.copyWith(status: Status.loading));

        final Map<String, dynamic> params = {
          'limit': '$limit',
          'sort': '${selectedSorting?.name}',
        };

        final List<UserModel> userList = await useCase.getUserList(params);
        isUserListLoaded = true;
        emit(
          state.copyWith(
            status: Status.success,
            userList: userList,
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

  void _getUserDetails(GetUserDetails event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final UserModel user = await useCase.getUserDetails(event.userId);
      emit(
        state.copyWith(
          selectedUser: user,
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

  void _addNewUser(AddNewUser event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(addedStatus: Status.loading));
      final String message = await useCase.addUser(event.requestBody);
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

  void _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(updatedStatus: Status.loading));
      final String message = await useCase.updateUser(event.requestBody);
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

  void _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(deletedStatus: Status.loading));
      final String message = await useCase.deleteUser(event.requestBody);
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
