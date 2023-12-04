import 'dart:developer';

import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/data/repositories/datas_repository.dart';
import 'package:bloc_sample_app/logic/cubit/gender_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_datas_event.dart';
part 'user_datas_state.dart';

class UserDatasBloc extends Bloc<UserDatasEvent, UserDatasState> {
  final GenderCubit? genderCubit;
  UserDatasBloc({this.genderCubit}) : super(UserDatasInitial()) {
    DataRepository dataRepository = DataRepository();
    log('bhvbhhu gknjohio');
    on<UserDatasEvent>((event, emit) async {
      try {
        emit(UserDatasLoading());
        final userDatasList =
            event.userData ?? await dataRepository.fetchUserData();
        log('bhvbhhu g${userDatasList[0].name?.first}');
        emit(UserDatasLoaded(userData: userDatasList));
        if (userDatasList.isEmpty) {
          emit(const UserDatasError(message: 'No items in here'));
        }
      } on NetworkError {
        emit(const UserDatasError(message: 'No Network'));
      }
    });
  }
}
