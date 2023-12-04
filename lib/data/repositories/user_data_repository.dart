import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/data/providers/user_data_provider.dart';

class UserDataRepository {
  final UserDataProvider _provider = UserDataProvider();
  Future<List<UserApiResults>> fetchUserData() {
    return _provider.fetchUserData();
  }
}

class NetworkError extends Error {}
