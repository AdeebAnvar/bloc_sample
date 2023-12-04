import 'dart:developer';

import 'package:bloc_sample_app/logic/bloc/user_datas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_screen_stack_mobile.dart';
import 'profile_screen_stack_mobile.dart';
import 'user_card.dart';

class MobileHomeUI extends StatefulWidget {
  const MobileHomeUI({super.key});

  @override
  State<MobileHomeUI> createState() => _MobileHomeUIState();
}

class _MobileHomeUIState extends State<MobileHomeUI> {
  UserDatasBloc userDatasBloc = UserDatasBloc();
  @override
  void initState() {
    userDatasBloc.add(const UserDatasEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocProvider(
          create: (_) => userDatasBloc,
          child: BlocListener<UserDatasBloc, UserDatasState>(
            listener: (context, state) {
              if (state is UserDatasError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<UserDatasBloc, UserDatasState>(
              buildWhen: (context, state) {
                log('state' + state.toString());

                return true;
              },
              builder: (context, state) {
                if (state is UserDatasInitial) {
                  return buildLoading();
                } else if (state is UserDatasLoading) {
                  return buildLoading();
                } else if (state is UserDatasLoaded) {
                  return UserCardsWidget(userData: state.userData!);
                } else if (state is UserDatasError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
        const ProfileScreenStackMobile(),
        const FilterScreenStackMobile(),
      ],
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
}
