import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class UserProfileEntity extends Equatable {
  final String login;
  final int id;
  final String type;
  final String? name;
  final String avatarUrl;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final String? bio;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;

  const UserProfileEntity({
    required this.login,
    required this.id,
    required this.type,
    required this.avatarUrl,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
  });

  const UserProfileEntity.init()
      : this(
          login: '',
          id: 0,
          type: '',
          name: null,
          avatarUrl: '',
          company: null,
          blog: null,
          location: null,
          email: null,
          bio: null,
          publicRepos: 0,
          publicGists: 0,
          followers: 0,
          following: 0,
        );

  UserProfileEntity copyWith({
    String? login,
    int? id,
    String? type,
    String? avatarUrl,
    ValueGetter<String?>? name,
    ValueGetter<String?>? company,
    ValueGetter<String?>? blog,
    ValueGetter<String?>? location,
    ValueGetter<String?>? email,
    ValueGetter<String?>? bio,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
  }) {
    return UserProfileEntity(
      login: login ?? this.login,
      id: id ?? this.id,
      type: type ?? this.type,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name != null ? name() : this.name,
      company: company != null ? company() : this.company,
      blog: blog != null ? blog() : this.blog,
      location: location != null ? location() : this.location,
      email: email != null ? email() : this.email,
      bio: bio != null ? bio() : this.bio,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  @override
  List<Object?> get props {
    return [
      login,
      id,
      type,
      name,
      company,
      blog,
      location,
      email,
      bio,
      publicRepos,
      publicGists,
      followers,
      following,
    ];
  }

  @override
  String toString() {
    return 'UserProfileEntity(login: $login, id: $id, type: $type, name: $name, company: $company, blog: $blog, location: $location, email: $email, bio: $bio, publicRepos: $publicRepos, publicGists: $publicGists, followers: $followers, following: $following)';
  }
}
