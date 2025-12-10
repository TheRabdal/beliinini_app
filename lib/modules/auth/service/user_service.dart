import 'package:beliinini_app/packages/packages.dart';

class UserService {
  Future<AuthResponse> getUser(int id) async {
    try {
      final response = await DioLogger.instance.get('https://fakestoreapi.com/users/$id');
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load user');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
}
