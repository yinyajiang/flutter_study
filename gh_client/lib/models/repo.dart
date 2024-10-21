import 'package:json_annotation/json_annotation.dart';

import 'license.dart';
import 'permissions.dart';
import 'user.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  int? id;
  String? name;
  @JsonKey(name: 'full_name')
  String? fullName;
  User? owner;
  @JsonKey(name: 'parent?')
  Repo? parent;
  bool? private;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  String? description;
  bool? fork;
  String? homepage;
  @JsonKey(name: 'language?')
  String? language;
  @JsonKey(name: 'forks_count')
  int? forksCount;
  @JsonKey(name: 'stargazers_count')
  int? stargazersCount;
  @JsonKey(name: 'watchers_count')
  int? watchersCount;
  int? size;
  @JsonKey(name: 'default_branch')
  String? defaultBranch;
  @JsonKey(name: 'open_issues_count')
  int? openIssuesCount;
  List<String>? topics;
  @JsonKey(name: 'has_issues')
  bool? hasIssues;
  @JsonKey(name: 'has_projects')
  bool? hasProjects;
  @JsonKey(name: 'has_wiki')
  bool? hasWiki;
  @JsonKey(name: 'has_pages')
  bool? hasPages;
  @JsonKey(name: 'has_downloads')
  bool? hasDownloads;
  @JsonKey(name: 'pushed_at')
  String? pushedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Permissions? permissions;
  @JsonKey(name: 'subscribers_count?')
  int? subscribersCount;
  @JsonKey(name: 'license?')
  License? license;

  Repo({
    this.id,
    this.name,
    this.fullName,
    this.owner,
    this.parent,
    this.private,
    this.htmlUrl,
    this.description,
    this.fork,
    this.homepage,
    this.language,
    this.forksCount,
    this.stargazersCount,
    this.watchersCount,
    this.size,
    this.defaultBranch,
    this.openIssuesCount,
    this.topics,
    this.hasIssues,
    this.hasProjects,
    this.hasWiki,
    this.hasPages,
    this.hasDownloads,
    this.pushedAt,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.subscribersCount,
    this.license,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
