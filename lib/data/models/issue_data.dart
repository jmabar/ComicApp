import 'dart:convert';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.role,
  });

  final int id;
  final String? name;
  final String? role;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"] ?? 'No Name',
        role: json["role"] ?? 'No Role',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name ?? 'No Name',
        "role": role ?? 'No role',
      };
}

class Location {
  Location({
    required this.id,
    required this.name,
    required this.role,
  });

  final int id;
  final String? name;
  final String? role;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"] ?? 'No Name',
        role: json["role"] ?? 'No Role',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name ?? 'No Name',
        "role": role ?? 'No role',
      };
}

class Person {
  Person({
    required this.id,
    required this.name,
    required this.role,
  });

  final int id;
  final String? name;
  final String? role;

  factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Person.fromMap(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"] ?? 'No Name',
        role: json["role"] ?? 'No Role',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name ?? 'No Name',
        "role": role ?? 'No role',
      };
}
