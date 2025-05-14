import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../domain/entity/user_profile_entity.dart';

class UserProfileModel extends Equatable {
  final String login;
  final int id;
  final String node_id;
  final String avatar_url;
  final String gravatar_id;
  final String url;
  final String html_url;
  final String followers_url;
  final String following_url;
  final String gists_url;
  final String starred_url;
  final String subscriptions_url;
  final String organizations_url;
  final String repos_url;
  final String events_url;
  final String received_events_url;
  final String type;
  final String user_view_type;
  final bool site_admin;
  final String? name;
  final String? company;
  final String blog;
  final String? location;
  final String? email;
  final String? hireable;
  final String? bio;
  final String? twitter_username;
  final int public_repos;
  final int public_gists;
  final int followers;
  final int following;
  final String created_at;
  final String updated_at;
  const UserProfileModel({
    required this.login,
    required this.id,
    required this.node_id,
    required this.avatar_url,
    required this.gravatar_id,
    required this.url,
    required this.html_url,
    required this.followers_url,
    required this.following_url,
    required this.gists_url,
    required this.starred_url,
    required this.subscriptions_url,
    required this.organizations_url,
    required this.repos_url,
    required this.events_url,
    required this.received_events_url,
    required this.type,
    required this.user_view_type,
    required this.site_admin,
    this.name,
    this.company,
    required this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitter_username,
    required this.public_repos,
    required this.public_gists,
    required this.followers,
    required this.following,
    required this.created_at,
    required this.updated_at,
  });

  UserProfileModel copyWith({
    String? login,
    int? id,
    String? node_id,
    String? avatar_url,
    String? gravatar_id,
    String? url,
    String? html_url,
    String? followers_url,
    String? following_url,
    String? gists_url,
    String? starred_url,
    String? subscriptions_url,
    String? organizations_url,
    String? repos_url,
    String? events_url,
    String? received_events_url,
    String? type,
    String? user_view_type,
    bool? site_admin,
    ValueGetter<String?>? name,
    ValueGetter<String?>? company,
    String? blog,
    ValueGetter<String?>? location,
    ValueGetter<String?>? email,
    ValueGetter<String?>? hireable,
    ValueGetter<String?>? bio,
    ValueGetter<String?>? twitter_username,
    int? public_repos,
    int? public_gists,
    int? followers,
    int? following,
    String? created_at,
    String? updated_at,
  }) {
    return UserProfileModel(
      login: login ?? this.login,
      id: id ?? this.id,
      node_id: node_id ?? this.node_id,
      avatar_url: avatar_url ?? this.avatar_url,
      gravatar_id: gravatar_id ?? this.gravatar_id,
      url: url ?? this.url,
      html_url: html_url ?? this.html_url,
      followers_url: followers_url ?? this.followers_url,
      following_url: following_url ?? this.following_url,
      gists_url: gists_url ?? this.gists_url,
      starred_url: starred_url ?? this.starred_url,
      subscriptions_url: subscriptions_url ?? this.subscriptions_url,
      organizations_url: organizations_url ?? this.organizations_url,
      repos_url: repos_url ?? this.repos_url,
      events_url: events_url ?? this.events_url,
      received_events_url: received_events_url ?? this.received_events_url,
      type: type ?? this.type,
      user_view_type: user_view_type ?? this.user_view_type,
      site_admin: site_admin ?? this.site_admin,
      name: name != null ? name() : this.name,
      company: company != null ? company() : this.company,
      blog: blog ?? this.blog,
      location: location != null ? location() : this.location,
      email: email != null ? email() : this.email,
      hireable: hireable != null ? hireable() : this.hireable,
      bio: bio != null ? bio() : this.bio,
      twitter_username: twitter_username != null ? twitter_username() : this.twitter_username,
      public_repos: public_repos ?? this.public_repos,
      public_gists: public_gists ?? this.public_gists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'id': id,
      'node_id': node_id,
      'avatar_url': avatar_url,
      'gravatar_id': gravatar_id,
      'url': url,
      'html_url': html_url,
      'followers_url': followers_url,
      'following_url': following_url,
      'gists_url': gists_url,
      'starred_url': starred_url,
      'subscriptions_url': subscriptions_url,
      'organizations_url': organizations_url,
      'repos_url': repos_url,
      'events_url': events_url,
      'received_events_url': received_events_url,
      'type': type,
      'user_view_type': user_view_type,
      'site_admin': site_admin,
      'name': name,
      'company': company,
      'blog': blog,
      'location': location,
      'email': email,
      'hireable': hireable,
      'bio': bio,
      'twitter_username': twitter_username,
      'public_repos': public_repos,
      'public_gists': public_gists,
      'followers': followers,
      'following': following,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      node_id: map['node_id'] ?? '',
      avatar_url: map['avatar_url'] ?? '',
      gravatar_id: map['gravatar_id'] ?? '',
      url: map['url'] ?? '',
      html_url: map['html_url'] ?? '',
      followers_url: map['followers_url'] ?? '',
      following_url: map['following_url'] ?? '',
      gists_url: map['gists_url'] ?? '',
      starred_url: map['starred_url'] ?? '',
      subscriptions_url: map['subscriptions_url'] ?? '',
      organizations_url: map['organizations_url'] ?? '',
      repos_url: map['repos_url'] ?? '',
      events_url: map['events_url'] ?? '',
      received_events_url: map['received_events_url'] ?? '',
      type: map['type'] ?? '',
      user_view_type: map['user_view_type'] ?? '',
      site_admin: map['site_admin'] ?? false,
      name: map['name'],
      company: map['company'],
      blog: map['blog'] ?? '',
      location: map['location'],
      email: map['email'],
      hireable: map['hireable'],
      bio: map['bio'],
      twitter_username: map['twitter_username'],
      public_repos: map['public_repos']?.toInt() ?? 0,
      public_gists: map['public_gists']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) => UserProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfileModel(login: $login, id: $id, node_id: $node_id, avatar_url: $avatar_url, gravatar_id: $gravatar_id, url: $url, html_url: $html_url, followers_url: $followers_url, following_url: $following_url, gists_url: $gists_url, starred_url: $starred_url, subscriptions_url: $subscriptions_url, organizations_url: $organizations_url, repos_url: $repos_url, events_url: $events_url, received_events_url: $received_events_url, type: $type, user_view_type: $user_view_type, site_admin: $site_admin, name: $name, company: $company, blog: $blog, location: $location, email: $email, hireable: $hireable, bio: $bio, twitter_username: $twitter_username, public_repos: $public_repos, public_gists: $public_gists, followers: $followers, following: $following, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  List<Object?> get props {
    return [
      login,
      id,
      node_id,
      avatar_url,
      gravatar_id,
      url,
      html_url,
      followers_url,
      following_url,
      gists_url,
      starred_url,
      subscriptions_url,
      organizations_url,
      repos_url,
      events_url,
      received_events_url,
      type,
      user_view_type,
      site_admin,
      name,
      company,
      blog,
      location,
      email,
      hireable,
      bio,
      twitter_username,
      public_repos,
      public_gists,
      followers,
      following,
      created_at,
      updated_at,
    ];
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      login: login,
      id: id,
      type: type,
      avatarUrl: avatar_url,
      name: name,
      company: company,
      blog: blog,
      location: location,
      email: email,
      bio: bio,
      publicRepos: public_repos,
      publicGists: public_gists,
      followers: followers,
      following: following,
    );
  }
}
