import 'dart:developer';

import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:dio/dio.dart';

class FilterDataProvider {
  Dio dio = Dio();
  Future<List<UserApiResults>> filterByGender(String gender) async {
    try {
      final Response<dynamic> response =
          await dio.get('https://randomuser.me/api/?gender=$gender');
      log(response.toString());
      log('uieifhrwiujkfvrifvmijdskcs 123456 filter');
      if (response.statusCode == 200) {
        final UserModel userModel =
            UserModel.fromJson(response.data as Map<String, dynamic>);
        return userModel.results!;
      } else {
        return <UserApiResults>[];
      }
    } catch (e) {
      log('Data $e');
      return <UserApiResults>[];
    }
  }
}
