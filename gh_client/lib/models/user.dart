import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? login;
  int? id;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  String? url;
  String? type;
  @JsonKey(name: 'site_admin')
  bool? siteAdmin;
  @JsonKey(name: 'name?')
  String? name;
  @JsonKey(name: 'company?')
  String? company;
  @JsonKey(name: 'blog?')
  String? blog;
  @JsonKey(name: 'location?')
  String? location;
  @JsonKey(name: 'email?')
  String? email;
  @JsonKey(name: 'hireable?')
  bool? hireable;
  @JsonKey(name: 'bio?')
  String? bio;
  @JsonKey(name: 'public_repos')
  int? publicRepos;
  @JsonKey(name: 'public_gists')
  int? publicGists;
  int? followers;
  int? following;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'total_private_repos')
  int? totalPrivateRepos;
  @JsonKey(name: 'owned_private_repos')
  int? ownedPrivateRepos;

  User({
    this.login,
    this.id,
    this.avatarUrl,
    this.url,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
  });

  @override
  String toString() {
    return 'User(login: $login, id: $id, avatarUrl: $avatarUrl, url: $url, type: $type, siteAdmin: $siteAdmin, name: $name, company: $company, blog: $blog, location: $location, email: $email, hireable: $hireable, bio: $bio, publicRepos: $publicRepos, publicGists: $publicGists, followers: $followers, following: $following, createdAt: $createdAt, updatedAt: $updatedAt, totalPrivateRepos: $totalPrivateRepos, ownedPrivateRepos: $ownedPrivateRepos)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      login.hashCode ^
      id.hashCode ^
      avatarUrl.hashCode ^
      url.hashCode ^
      type.hashCode ^
      siteAdmin.hashCode ^
      name.hashCode ^
      company.hashCode ^
      blog.hashCode ^
      location.hashCode ^
      email.hashCode ^
      hireable.hashCode ^
      bio.hashCode ^
      publicRepos.hashCode ^
      publicGists.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      totalPrivateRepos.hashCode ^
      ownedPrivateRepos.hashCode;
}
