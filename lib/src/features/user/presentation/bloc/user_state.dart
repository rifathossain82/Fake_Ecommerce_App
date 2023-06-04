part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.status = Status.initial,
    this.message = '',
    this.userList = const <UserModel>[],
    this.selectedUser,
    this.addedStatus = Status.initial,
    this.updatedStatus = Status.initial,
    this.deletedStatus = Status.initial,
  });

  final Status status;
  final String message;
  final List<UserModel> userList;
  final UserModel? selectedUser;
  final Status addedStatus;
  final Status updatedStatus;
  final Status deletedStatus;

  UserState copyWith({
    Status? status,
    String? message,
    List<UserModel>? userList,
    UserModel? selectedUser,
    Status? addedStatus,
    Status? updatedStatus,
    Status? deletedStatus,
  }) {
    return UserState(
      status: status ?? this.status,
      message: message ?? this.message,
      userList: userList ?? this.userList,
      selectedUser: selectedUser ?? this.selectedUser,
      addedStatus: addedStatus ?? this.addedStatus,
      updatedStatus: updatedStatus ?? this.updatedStatus,
      deletedStatus: deletedStatus ?? this.deletedStatus,
    );
  }

  @override
  String toString() {
    return '''UserState { 
      status: $status, 
      message: $message,
      userList: ${userList.length},
      selectedUser: $selectedUser,
      addedStatus: $addedStatus,
      updatedStatus: $updatedStatus,
      deletedStatus: $deletedStatus
    }''';
  }

  @override
  List<Object> get props => [
        status,
        message,
        userList,
        selectedUser.toString(),
        addedStatus,
        updatedStatus,
        deletedStatus,
      ];
}
