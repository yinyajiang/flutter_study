import 'package:json_annotation/json_annotation.dart';

part 'permissions.g.dart';

@JsonSerializable()
class Permissions {
  bool? admin;
  bool? push;
  bool? pull;

  Permissions({this.admin, this.push, this.pull});

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return _$PermissionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PermissionsToJson(this);
}
