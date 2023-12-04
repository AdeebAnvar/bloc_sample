import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/data/repositories/user_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final UserDataRepository userDataRepository = UserDataRepository();

    on<UserEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final userDataList = await userDataRepository.fetchUserData();
        emit(UserLoaded(userData: userDataList));
        if (userDataList.isEmpty) {
          emit(const UserError(message: 'Data Empty'));
        }
      } on NetworkError {
        emit(const UserError(message: 'Netwprk Error'));
      }
    });
  }
}
