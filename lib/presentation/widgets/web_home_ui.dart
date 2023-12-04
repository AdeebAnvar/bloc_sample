import 'dart:developer';

import 'package:bloc_sample_app/logic/bloc/user_bloc.dart';
import 'package:bloc_sample_app/logic/bloc/user_datas_bloc.dart';
import 'package:bloc_sample_app/logic/cubit/gender_cubit.dart';
import 'package:bloc_sample_app/presentation/widgets/gender_selection_card.dart';
import 'package:bloc_sample_app/presentation/widgets/profile_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_card.dart';

class WebHomeUI extends StatefulWidget {
  const WebHomeUI({super.key});

  @override
  State<WebHomeUI> createState() => _WebHomeUIState();
}

class _WebHomeUIState extends State<WebHomeUI> {
  UserBloc userBloc = UserBloc();
  UserDatasBloc userDatasBloc = UserDatasBloc();

  @override
  void initState() {
    userBloc.add(const UserEvent());
    userDatasBloc.add(UserDatasEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildProfileSection(context),
        Expanded(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        log('onpressed 1');
                        BlocProvider.of<GenderCubit>(context)
                            .launchFilterCard();
                      },
                      child: const Text('Filter')),
                  const SizedBox(width: 20)
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
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
                BlocConsumer<GenderCubit, GenderState>(
                  listener: (context, state) {
                    log(state.isFilterCardOpen.toString());
                  },
                  builder: (ctx, state) {
                    return buildHomeUserCard(context, state);
                  },
                )
              ],
            ))
          ],
        ))
      ],
    );
  }

  Widget buildHomeUserCard(BuildContext context, GenderState state) {
    return Align(
      alignment: Alignment.topRight,
      child: Visibility(
        visible: state.isFilterCardOpen,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 5,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GenderSelectionCard(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void onClickFilter(BuildContext context) {
  //   if (isFilterCardOpen) {
  //     isFilterCardOpen = false;
  //   } else {
  //     isFilterCardOpen = true;
  //   }
  // }

  Widget buildProfileSection(BuildContext context) {
    return BlocProvider(
      create: (context) => userBloc,
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return buildLoading();
            } else if (state is UserLoading) {
              return buildLoading();
            } else if (state is UserLoaded) {
              return ProfileSectionWidget(userData: state.userData);
            } else if (state is UserError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
}
