import 'package:beliinini_app/packages/packages.dart';

class Address extends Equatable {
  const Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  Address copyWith({
    Geolocation? geolocation,
    String? city,
    String? street,
    int? number,
    String? zipcode,
  }) {
    return Address(
      geolocation: geolocation ?? this.geolocation,
      city: city ?? this.city,
      street: street ?? this.street,
      number: number ?? this.number,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      geolocation: json["geolocation"] == null
          ? null
          : Geolocation.fromJson(json["geolocation"]),
      city: json["city"],
      street: json["street"],
      number: json["number"],
      zipcode: json["zipcode"],
    );
  }

  @override
  String toString() {
    return "$geolocation, $city, $street, $number, $zipcode, ";
  }

  @override
  List<Object?> get props => [geolocation, city, street, number, zipcode];
}
