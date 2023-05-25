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
