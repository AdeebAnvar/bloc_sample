import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:bloc_sample_app/data/providers/filter_provider.dart';

class FilterRepository {
  final FilterDataProvider _provider = FilterDataProvider();
  Future<List<UserApiResults>> fetchUserData(String gender) {
    return _provider.filterByGender(gender);
  }
}

class NetworkError extends Error {}
