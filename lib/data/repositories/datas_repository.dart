import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/data/providers/data_provider.dart';

class DataRepository {
  final DatasProvider _provider = DatasProvider();
  Future<List<UserApiResults>> fetchUserData() {
    return _provider.fetchData();
  }
}

class NetworkError extends Error {}
