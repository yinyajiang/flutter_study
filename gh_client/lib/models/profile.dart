import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  User? user;
  String? token;
  int? theme;
  String? cache;
  String? lastLogin;
  String? locale;

  Profile({
    this.user,
    this.token,
    this.theme,
    this.cache,
    this.lastLogin,
    this.locale,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
