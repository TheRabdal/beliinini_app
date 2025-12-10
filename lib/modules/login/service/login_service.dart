import 'package:beliinini_app/packages/packages.dart';

class LoginService {
  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await DioLogger.instance.post(
        'https://fakestoreapi.com/auth/login',
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 201) {
        final data = response.data;
        final token = data['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return LoginResponse.fromJson(data);
      } else {
        throw Exception('Gagal untuk login');
      }
    } on DioException catch (e) {
      throw Exception('Login gagal...: $e');
    }
  }
}
