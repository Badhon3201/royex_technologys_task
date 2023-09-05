import 'dart:convert';

import 'labels_response_model.dart';

class IssuesResponseModel {
  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  User? user;
  List<LabelsResponseModel>? labels;
  String? state;
  bool? locked;
  dynamic assignee;
  List<dynamic>? assignees;
  dynamic milestone;
  int? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic closedAt;
  AuthorAssociation? authorAssociation;
  dynamic activeLockReason;
  String? body;
  Reactions? reactions;
  String? timelineUrl;
  dynamic performedViaGithubApp;
  String? stateReason;
  bool? draft;
  PullRequest? pullRequest;

  IssuesResponseModel({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignee,
    this.assignees,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.activeLockReason,
    this.body,
    this.reactions,
    this.timelineUrl,
    this.performedViaGithubApp,
    this.stateReason,
    this.draft,
    this.pullRequest,
  });

  factory IssuesResponseModel.fromRawJson(String str) =>
      IssuesResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssuesResponseModel.fromJson(Map<String, dynamic> json) =>
      IssuesResponseModel(
        url: json['url'],
        repositoryUrl: json['repository_url'],
        labelsUrl: json['labels_url'],
        commentsUrl: json['comments_url'],
        eventsUrl: json['events_url'],
        htmlUrl: json['html_url'],
        id: json['id'],
        nodeId: json['node_id'],
        number: json['number'],
        title: json['title'],
        user: json['user'] == null ? null : User.fromJson(json['user']),
        labels: json["labels"] == null
            ? []
            : List<LabelsResponseModel>.from(
                json["labels"]!.map((x) => LabelsResponseModel.fromJson(x))),
        state: json['state'],
        locked: json['locked'],
        assignee: json['assignee'],
        assignees: json['assignees'] == null
            ? []
            : List<dynamic>.from(json['assignees']!.map((x) => x)),
        milestone: json['milestone'],
        comments: json['comments'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        closedAt: json['closed_at'],
        authorAssociation:
            authorAssociationValues.map[json['author_association']],
        activeLockReason: json['active_lock_reason'],
        body: json['body'],
        reactions: json['reactions'] == null
            ? null
            : Reactions.fromJson(json['reactions']),
        timelineUrl: json['timeline_url'],
        performedViaGithubApp: json['performed_via_github_app'],
        stateReason: json['state_reason'],
        draft: json['draft'],
        pullRequest: json['pull_request'] == null
            ? null
            : PullRequest.fromJson(json['pull_request']),
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'repository_url': repositoryUrl,
        'labels_url': labelsUrl,
        'comments_url': commentsUrl,
        'events_url': eventsUrl,
        'html_url': htmlUrl,
        'id': id,
        'node_id': nodeId,
        'number': number,
        'title': title,
        'user': user?.toJson(),
        'labels':
            labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
        'state': state,
        'locked': locked,
        'assignee': assignee,
        'assignees': assignees == null
            ? []
            : List<dynamic>.from(assignees!.map((x) => x)),
        'milestone': milestone,
        'comments': comments,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'closed_at': closedAt,
        'author_association':
            authorAssociationValues.reverse[authorAssociation],
        'active_lock_reason': activeLockReason,
        'body': body,
        'reactions': reactions?.toJson(),
        'timeline_url': timelineUrl,
        'performed_via_github_app': performedViaGithubApp,
        'state_reason': stateReason,
        'draft': draft,
        'pull_request': pullRequest?.toJson(),
      };
}

enum AuthorAssociation { CONTRIBUTOR, NONE }

final authorAssociationValues = EnumValues({
  'CONTRIBUTOR': AuthorAssociation.CONTRIBUTOR,
  'NONE': AuthorAssociation.NONE
});

class PullRequest {
  String? url;
  String? htmlUrl;
  String? diffUrl;
  String? patchUrl;
  dynamic mergedAt;

  PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
    this.mergedAt,
  });

  factory PullRequest.fromRawJson(String str) =>
      PullRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
        url: json['url'],
        htmlUrl: json['html_url'],
        diffUrl: json['diff_url'],
        patchUrl: json['patch_url'],
        mergedAt: json['merged_at'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'html_url': htmlUrl,
        'diff_url': diffUrl,
        'patch_url': patchUrl,
        'merged_at': mergedAt,
      };
}

class Reactions {
  String? url;
  int? totalCount;
  int? the1;
  int? reactions1;
  int? laugh;
  int? hooray;
  int? confused;
  int? heart;
  int? rocket;
  int? eyes;

  Reactions({
    this.url,
    this.totalCount,
    this.the1,
    this.reactions1,
    this.laugh,
    this.hooray,
    this.confused,
    this.heart,
    this.rocket,
    this.eyes,
  });

  factory Reactions.fromRawJson(String str) =>
      Reactions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        url: json['url'],
        totalCount: json['total_count'],
        the1: json['+1'],
        reactions1: json['-1'],
        laugh: json['laugh'],
        hooray: json['hooray'],
        confused: json['confused'],
        heart: json['heart'],
        rocket: json['rocket'],
        eyes: json['eyes'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'total_count': totalCount,
        '+1': the1,
        '-1': reactions1,
        'laugh': laugh,
        'hooray': hooray,
        'confused': confused,
        'heart': heart,
        'rocket': rocket,
        'eyes': eyes,
      };
}

class User {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  Type? type;
  bool? siteAdmin;

  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json['login'],
        id: json['id'],
        nodeId: json['node_id'],
        avatarUrl: json['avatar_url'],
        gravatarId: json['gravatar_id'],
        url: json['url'],
        htmlUrl: json['html_url'],
        followersUrl: json['followers_url'],
        followingUrl: json['following_url'],
        gistsUrl: json['gists_url'],
        starredUrl: json['starred_url'],
        subscriptionsUrl: json['subscriptions_url'],
        organizationsUrl: json['organizations_url'],
        reposUrl: json['repos_url'],
        eventsUrl: json['events_url'],
        receivedEventsUrl: json['received_events_url'],
        type: typeValues.map[json['type']],
        siteAdmin: json['site_admin'],
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': typeValues.reverse[type],
        'site_admin': siteAdmin,
      };
}

enum Type { USER }

final typeValues = EnumValues({'User': Type.USER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
