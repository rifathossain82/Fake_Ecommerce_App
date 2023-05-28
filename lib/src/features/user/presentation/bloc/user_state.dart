part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<UserModel> userList;

  const UserLoaded({required this.userList});

  @override
  List<Object> get props => [userList];
}

class UserDetailsLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoaded extends UserState {
  final UserModel user;

  const UserDetailsLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserAddedSuccess extends UserState {
  final String message;

  const UserAddedSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UserUpdateSuccess extends UserState {
  final String message;

  const UserUpdateSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UserDeleteSuccess extends UserState {
  final String message;

  const UserDeleteSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UserError extends UserState {
  final String message;

  const UserError({required this.message});

  @override
  List<Object> get props => [message];
}
