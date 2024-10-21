import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable()
class License {
  String? key;
  String? name;
  @JsonKey(name: 'spdx_id')
  String? spdxId;
  String? url;
  @JsonKey(name: 'node_id')
  String? nodeId;

  License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  factory License.fromJson(Map<String, dynamic> json) {
    return _$LicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}
