import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/logic/bloc/user_bloc.dart';
import 'package:bloc_sample_app/presentation/animation/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenStackMobile extends StatefulWidget {
  const ProfileScreenStackMobile({super.key});

  @override
  State<ProfileScreenStackMobile> createState() =>
      _ProfileScreenStackMobileState();
}

class _ProfileScreenStackMobileState extends State<ProfileScreenStackMobile> {
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    userBloc.add(const UserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => userBloc,
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
              return buildAnimatedCard(context, state.userData);
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

  AnimatedBuilder buildAnimatedCard(
      BuildContext context, List<UserApiResults> userData) {
    return AnimatedBuilder(
        animation: profileAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(profileAnimation.value, 0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.teal[700],
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width / 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 10, color: Colors.white)),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  userData[0].picture!.medium.toString()),
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                const SizedBox(height: 60),
                                Text(
                                  '${userData[0].name?.title} ${userData[0].name?.first} ${userData[0].name?.last}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  'email : ${userData[0].email}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'phone : ${userData[0].phone}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                            onPressed: () => onLogout(context),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  //    } else {

                  ));
        });
  }
}

Widget buildLoading() => const Center(child: CircularProgressIndicator());

void onLogout(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
