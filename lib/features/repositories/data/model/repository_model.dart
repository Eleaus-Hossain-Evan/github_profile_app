import 'package:equatable/equatable.dart';

import '../../domain/entity/repository_entity.dart';

class RepositoryModel extends Equatable {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final OwnerModel owner;
  final String htmlUrl;
  final String? description;
  final bool fork;
  final String url;
  final String forksUrl;
  final String keysUrl;
  final String collaboratorsUrl;
  final String teamsUrl;
  final String hooksUrl;
  final String issueEventsUrl;
  final String eventsUrl;
  final String assigneesUrl;
  final String branchesUrl;
  final String tagsUrl;
  final String blobsUrl;
  final String gitTagsUrl;
  final String gitRefsUrl;
  final String treesUrl;
  final String statusesUrl;
  final String languagesUrl;
  final String stargazersUrl;
  final String contributorsUrl;
  final String subscribersUrl;
  final String subscriptionUrl;
  final String commitsUrl;
  final String gitCommitsUrl;
  final String commentsUrl;
  final String issueCommentUrl;
  final String contentsUrl;
  final String compareUrl;
  final String mergesUrl;
  final String archiveUrl;
  final String downloadsUrl;
  final String issuesUrl;
  final String pullsUrl;
  final String milestonesUrl;
  final String notificationsUrl;
  final String labelsUrl;
  final String releasesUrl;
  final String deploymentsUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  final String gitUrl;
  final String sshUrl;
  final String cloneUrl;
  final String svnUrl;
  final String? homepage;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool hasPages;
  final bool hasDiscussions;
  final int forksCount;
  final dynamic mirrorUrl;
  final bool archived;
  final bool disabled;
  final int openIssuesCount;
  final LicenseModel? license;
  final bool allowForking;
  final bool isTemplate;
  final bool webCommitSignoffRequired;
  final List<String> topics;
  final String visibility;
  final int forks;
  final int openIssues;
  final int watchers;
  final String defaultBranch;

  const RepositoryModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.hasDiscussions,
    required this.forksCount,
    this.mirrorUrl,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    this.license,
    required this.allowForking,
    required this.isTemplate,
    required this.webCommitSignoffRequired,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
  });

  factory RepositoryModel.fromMap(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      private: json['private'] as bool,
      owner: OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String,
      description: json['description'] as String?,
      fork: json['fork'] as bool,
      url: json['url'] as String,
      forksUrl: json['forks_url'] as String,
      keysUrl: json['keys_url'] as String,
      collaboratorsUrl: json['collaborators_url'] as String,
      teamsUrl: json['teams_url'] as String,
      hooksUrl: json['hooks_url'] as String,
      issueEventsUrl: json['issue_events_url'] as String,
      eventsUrl: json['events_url'] as String,
      assigneesUrl: json['assignees_url'] as String,
      branchesUrl: json['branches_url'] as String,
      tagsUrl: json['tags_url'] as String,
      blobsUrl: json['blobs_url'] as String,
      gitTagsUrl: json['git_tags_url'] as String,
      gitRefsUrl: json['git_refs_url'] as String,
      treesUrl: json['trees_url'] as String,
      statusesUrl: json['statuses_url'] as String,
      languagesUrl: json['languages_url'] as String,
      stargazersUrl: json['stargazers_url'] as String,
      contributorsUrl: json['contributors_url'] as String,
      subscribersUrl: json['subscribers_url'] as String,
      subscriptionUrl: json['subscription_url'] as String,
      commitsUrl: json['commits_url'] as String,
      gitCommitsUrl: json['git_commits_url'] as String,
      commentsUrl: json['comments_url'] as String,
      issueCommentUrl: json['issue_comment_url'] as String,
      contentsUrl: json['contents_url'] as String,
      compareUrl: json['compare_url'] as String,
      mergesUrl: json['merges_url'] as String,
      archiveUrl: json['archive_url'] as String,
      downloadsUrl: json['downloads_url'] as String,
      issuesUrl: json['issues_url'] as String,
      pullsUrl: json['pulls_url'] as String,
      milestonesUrl: json['milestones_url'] as String,
      notificationsUrl: json['notifications_url'] as String,
      labelsUrl: json['labels_url'] as String,
      releasesUrl: json['releases_url'] as String,
      deploymentsUrl: json['deployments_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      pushedAt: DateTime.parse(json['pushed_at'] as String),
      gitUrl: json['git_url'] as String,
      sshUrl: json['ssh_url'] as String,
      cloneUrl: json['clone_url'] as String,
      svnUrl: json['svn_url'] as String,
      homepage: json['homepage'] as String?,
      size: json['size'] as int,
      stargazersCount: json['stargazers_count'] as int,
      watchersCount: json['watchers_count'] as int,
      language: json['language'] as String?,
      hasIssues: json['has_issues'] as bool,
      hasProjects: json['has_projects'] as bool,
      hasDownloads: json['has_downloads'] as bool,
      hasWiki: json['has_wiki'] as bool,
      hasPages: json['has_pages'] as bool,
      hasDiscussions: json['has_discussions'] as bool,
      forksCount: json['forks_count'] as int,
      mirrorUrl: json['mirror_url'],
      archived: json['archived'] as bool,
      disabled: json['disabled'] as bool,
      openIssuesCount: json['open_issues_count'] as int,
      license: json['license'] == null
          ? null
          : LicenseModel.fromJson(json['license'] as Map<String, dynamic>),
      allowForking: json['allow_forking'] as bool,
      isTemplate: json['is_template'] as bool,
      webCommitSignoffRequired: json['web_commit_signoff_required'] as bool,
      topics: (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
      visibility: json['visibility'] as String,
      forks: json['forks'] as int,
      openIssues: json['open_issues'] as int,
      watchers: json['watchers'] as int,
      defaultBranch: json['default_branch'] as String,
    );
  }

  RepositoryEntity toEntity() {
    return RepositoryEntity(
      id: id.toString(),
      name: name,
      description: description,
      stargazersCount: stargazersCount,
      forksCount: forksCount,
      language: language,
      htmlUrl: htmlUrl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nodeId,
        name,
        fullName,
        private,
        owner,
        htmlUrl,
        description,
        fork,
        url,
        forksUrl,
        keysUrl,
        collaboratorsUrl,
        teamsUrl,
        hooksUrl,
        issueEventsUrl,
        eventsUrl,
        assigneesUrl,
        branchesUrl,
        tagsUrl,
        blobsUrl,
        gitTagsUrl,
        gitRefsUrl,
        treesUrl,
        statusesUrl,
        languagesUrl,
        stargazersUrl,
        contributorsUrl,
        subscribersUrl,
        subscriptionUrl,
        commitsUrl,
        gitCommitsUrl,
        commentsUrl,
        issueCommentUrl,
        contentsUrl,
        compareUrl,
        mergesUrl,
        archiveUrl,
        downloadsUrl,
        issuesUrl,
        pullsUrl,
        milestonesUrl,
        notificationsUrl,
        labelsUrl,
        releasesUrl,
        deploymentsUrl,
        createdAt,
        updatedAt,
        pushedAt,
        gitUrl,
        sshUrl,
        cloneUrl,
        svnUrl,
        homepage,
        size,
        stargazersCount,
        watchersCount,
        language,
        hasIssues,
        hasProjects,
        hasDownloads,
        hasWiki,
        hasPages,
        hasDiscussions,
        forksCount,
        mirrorUrl,
        archived,
        disabled,
        openIssuesCount,
        license,
        allowForking,
        isTemplate,
        webCommitSignoffRequired,
        topics,
        visibility,
        forks,
        openIssues,
        watchers,
        defaultBranch,
      ];
}

class OwnerModel extends Equatable {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  const OwnerModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      gravatarId: json['gravatar_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      followersUrl: json['followers_url'] as String,
      followingUrl: json['following_url'] as String,
      gistsUrl: json['gists_url'] as String,
      starredUrl: json['starred_url'] as String,
      subscriptionsUrl: json['subscriptions_url'] as String,
      organizationsUrl: json['organizations_url'] as String,
      reposUrl: json['repos_url'] as String,
      eventsUrl: json['events_url'] as String,
      receivedEventsUrl: json['received_events_url'] as String,
      type: json['type'] as String,
      siteAdmin: json['site_admin'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        login,
        id,
        nodeId,
        avatarUrl,
        gravatarId,
        url,
        htmlUrl,
        followersUrl,
        followingUrl,
        gistsUrl,
        starredUrl,
        subscriptionsUrl,
        organizationsUrl,
        reposUrl,
        eventsUrl,
        receivedEventsUrl,
        type,
        siteAdmin,
      ];
}

class LicenseModel extends Equatable {
  final String key;
  final String name;
  final String spdxId;
  final String? url;
  final String nodeId;

  const LicenseModel({
    required this.key,
    required this.name,
    required this.spdxId,
    this.url,
    required this.nodeId,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      key: json['key'] as String,
      name: json['name'] as String,
      spdxId: json['spdx_id'] as String,
      url: json['url'] as String?,
      nodeId: json['node_id'] as String,
    );
  }

  @override
  List<Object?> get props => [key, name, spdxId, url, nodeId];
}
