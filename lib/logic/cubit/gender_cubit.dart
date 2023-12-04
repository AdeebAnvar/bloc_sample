import 'dart:developer';

import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/data/repositories/filter_repository.dart';
import 'package:bloc_sample_app/logic/bloc/user_datas_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  final FilterRepository filterRepository = FilterRepository();

  GenderCubit() : super(const GenderInitial(gender: ''));

  void handleGenderChange(String gender) => emit(
      GenderState(gender: gender, isFilterCardOpen: state.isFilterCardOpen));

  void launchFilterCard() => emit(GenderState(
      gender: state.gender, isFilterCardOpen: !state.isFilterCardOpen));

  Future<void> filterDataByGender(BuildContext context) async {
    log('message');
    final newData = await FilterRepository().fetchUserData(state.gender);
    UserDatasBloc userDatasBloc = UserDatasBloc();
    userDatasBloc.add(UserDatasEvent(userData: newData));

    // context.read<UserDatasBloc>().add(UserDatasEvent(userData: newData));
  }
}
