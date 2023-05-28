part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUserList extends UserEvent {
  @override
  List<Object?> get props => [];
}

class GetUserDetails extends UserEvent {
  final int userId;
  const GetUserDetails({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class AddNewUser extends UserEvent {
  final Map<String, dynamic> requestBody;
  const AddNewUser({required this.requestBody});

  @override
  List<Object?> get props => [requestBody];
}

class UpdateUser extends UserEvent {
  final Map<String, dynamic> requestBody;
  const UpdateUser({required this.requestBody});

  @override
  List<Object?> get props => [requestBody];
}

class DeleteUser extends UserEvent {
  final Map<String, dynamic> requestBody;
  const DeleteUser({required this.requestBody});

  @override
  List<Object?> get props => [requestBody];
}
