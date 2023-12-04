part of 'user_datas_bloc.dart';

class UserDatasEvent extends Equatable {
  final List<UserApiResults>? userData;
  const UserDatasEvent({this.userData});

  @override
  List<Object> get props => [userData ?? []];
}
