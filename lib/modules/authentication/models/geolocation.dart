import 'package:beliinini_app/packages/packages.dart';

class Geolocation extends Equatable {
  const Geolocation({required this.lat, required this.long});

  final String? lat;
  final String? long;

  Geolocation copyWith({String? lat, String? long}) {
    return Geolocation(lat: lat ?? this.lat, long: long ?? this.long);
  }

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(lat: json["lat"], long: json["long"]);
  }

  @override
  String toString() {
    return "$lat, $long, ";
  }

  @override
  List<Object?> get props => [lat, long];
}
