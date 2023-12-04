part of 'user_datas_bloc.dart';

abstract class UserDatasState extends Equatable {
  final List<UserApiResults>? userData;
  const UserDatasState({this.userData});

  @override
  List<Object> get props => [userData ?? []];
}

class UserDatasInitial extends UserDatasState {}

class UserDatasLoading extends UserDatasState {}

class UserDatasLoaded extends UserDatasState {
  const UserDatasLoaded({required List<UserApiResults> userData})
      : super(userData: userData);
}

class UserDatasError extends UserDatasState {
  final String? message;
  const UserDatasError({required this.message});
}
