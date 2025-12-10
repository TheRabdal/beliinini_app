import 'package:beliinini_app/packages/packages.dart';

class LoginResponse extends Equatable {
  const LoginResponse({required this.token});

  final String? token;
  LoginResponse copyWith({String? token}) {
    return LoginResponse(token: token ?? this.token);
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(token: json["token"]);
  }

  @override
  String toString() {
    return "$token, ";
  }

  @override
  List<Object?> get props => [token];
}
