// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      login: json['login'] as String?,
      id: (json['id'] as num?)?.toInt(),
      avatarUrl: json['avatar_url'] as String?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      siteAdmin: json['site_admin'] as bool?,
      name: json['name?'] as String?,
      company: json['company?'] as String?,
      blog: json['blog?'] as String?,
      location: json['location?'] as String?,
      email: json['email?'] as String?,
      hireable: json['hireable?'] as bool?,
      bio: json['bio?'] as String?,
      publicRepos: (json['public_repos'] as num?)?.toInt(),
      publicGists: (json['public_gists'] as num?)?.toInt(),
      followers: (json['followers'] as num?)?.toInt(),
      following: (json['following'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      totalPrivateRepos: (json['total_private_repos'] as num?)?.toInt(),
      ownedPrivateRepos: (json['owned_private_repos'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'url': instance.url,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
      'name?': instance.name,
      'company?': instance.company,
      'blog?': instance.blog,
      'location?': instance.location,
      'email?': instance.email,
      'hireable?': instance.hireable,
      'bio?': instance.bio,
      'public_repos': instance.publicRepos,
      'public_gists': instance.publicGists,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'total_private_repos': instance.totalPrivateRepos,
      'owned_private_repos': instance.ownedPrivateRepos,
    };
