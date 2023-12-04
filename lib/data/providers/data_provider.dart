import 'dart:developer';

import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:dio/dio.dart';

class DatasProvider {
  Dio dio = Dio();
  Future<List<UserApiResults>> fetchData() async {
    try {
      final Response<dynamic> response =
          await dio.get('https://randomuser.me/api/?results=5000');
      log('filter$response');
      log('uieifhrwiujkfvrifvmijdskcs 123456 data');
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
