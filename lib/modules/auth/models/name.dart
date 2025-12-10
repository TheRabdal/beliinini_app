import 'package:beliinini_app/packages/packages.dart';

class Name extends Equatable {
  const Name({required this.firstname, required this.lastname});

  final String? firstname;
  final String? lastname;

  Name copyWith({String? firstname, String? lastname}) {
    return Name(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(firstname: json["firstname"], lastname: json["lastname"]);
  }

  @override
  String toString() {
    return "$firstname, $lastname, ";
  }

  @override
  List<Object?> get props => [firstname, lastname];
}
