import 'dart:developer';

import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:dio/dio.dart';

class UserDataProvider {
  Dio dio = Dio();
  Future<List<UserApiResults>> fetchUserData() async {
    try {
      final Response<dynamic> response =
          await dio.get('https://randomuser.me/api');
      log(response.toString());
      if (response.statusCode == 200) {
        log('uieifhrwiujkfvrifvmijdskcs 123456 user');
        final UserModel userModel =
            UserModel.fromJson(response.data as Map<String, dynamic>);
        return userModel.results!;
      } else {
        return <UserApiResults>[];
      }
    } catch (e) {
      log(e.toString());
      return <UserApiResults>[];
    }
  }
}
