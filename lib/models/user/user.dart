import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? role;
  final String? name;
  final String? email;
  final String? token;
  const User({this.id, this.role, this.name, this.email, this.token});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  User copyWith(
          {String? id,
          String? role,
          String? name,
          String? email,
          String? token}) =>
      User(
        id: id ?? this.id,
        role: role ?? this.role,
        name: name ?? this.name,
        email: email ?? this.email,
        token: token ?? this.token,
      );
  @override
  String toString() => '''
  id: $id,
  role: $role,
  name: $name,
  email: $email,
  token: $token,
  ''';
}
