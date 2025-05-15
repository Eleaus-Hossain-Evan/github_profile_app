import 'package:equatable/equatable.dart';

class RepositoryEntity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final int stargazersCount;
  final int forksCount;
  final String? language;
  final String htmlUrl;

  const RepositoryEntity({
    required this.id,
    required this.name,
    this.description,
    required this.stargazersCount,
    required this.forksCount,
    this.language,
    required this.htmlUrl,
  });

  const RepositoryEntity.init()
      : this(
          id: '',
          name: '',
          description: null,
          stargazersCount: 0,
          forksCount: 0,
          language: null,
          htmlUrl: '',
        );

  RepositoryEntity copyWith({
    String? id,
    String? name,
    String? description,
    int? stargazersCount,
    int? forksCount,
    String? language,
    String? htmlUrl,
  }) {
    return RepositoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      forksCount: forksCount ?? this.forksCount,
      language: language ?? this.language,
      htmlUrl: htmlUrl ?? this.htmlUrl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        stargazersCount,
        forksCount,
        language,
        htmlUrl,
      ];
}
