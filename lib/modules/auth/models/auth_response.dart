import 'package:beliinini_app/packages/packages.dart';

class AuthResponse extends Equatable {
  const AuthResponse({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  final Address? address;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final String? phone;
  final int? v;

  AuthResponse copyWith({
    Address? address,
    int? id,
    String? email,
    String? username,
    String? password,
    Name? name,
    String? phone,
    int? v,
  }) {
    return AuthResponse(
      address: address ?? this.address,
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      v: v ?? this.v,
    );
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      address: json["address"] == null
          ? null
          : Address.fromJson(json["address"]),
      id: json["id"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      phone: json["phone"],
      v: json["__v"],
    );
  }

  @override
  String toString() {
    return "$address, $id, $email, $username, $password, $name, $phone, $v, ";
  }

  @override
  List<Object?> get props => [
    address,
    id,
    email,
    username,
    password,
    name,
    phone,
    v,
  ];
}
