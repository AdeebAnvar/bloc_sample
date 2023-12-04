import 'package:bloc_sample_app/logic/bloc/user_bloc.dart';
import 'package:bloc_sample_app/logic/bloc/user_datas_bloc.dart';
import 'package:bloc_sample_app/logic/cubit/gender_cubit.dart';
import 'package:bloc_sample_app/logic/cubit/gender_cubit.dart';
import 'package:bloc_sample_app/presentation/pages/home_screen.dart';
import 'package:bloc_sample_app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenderCubit>(
          create: (ctx) => GenderCubit(),
        ),
        BlocProvider<UserDatasBloc>(
          create: (ctx) => UserDatasBloc(genderCubit: ctx.watch<GenderCubit>()),
        ),
        BlocProvider<UserBloc>(
          create: (ctx) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter().fetchAppRoutes,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
