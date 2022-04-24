// ignore_for_file: must_be_immutable

import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/issues.dart';
import 'package:equatable/equatable.dart';

class IssuesSearchResponse extends Equatable {
  const IssuesSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.issue,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<IssueModel> issue;

  factory IssuesSearchResponse.fromJson(Map<String, dynamic> json) =>
      IssuesSearchResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        issue: List<IssueModel>.from(
            json["items"].map((x) => IssueModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(issue.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        totalCount,
        incompleteResults,
        issue,
      ];
}

class IssueModel extends Equatable {
  const IssueModel({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.assignee,
    required this.assignees,
    required this.milestone,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.authorAssociation,
    required this.activeLockReason,
    required this.body,
    required this.reactions,
    required this.timelineUrl,
    required this.performedViaGithubApp,
    required this.score,
    required this.draft,
    required this.pullRequest,
  });

  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final UserModel user;
  final List<Label> labels;
  final String state;
  final bool locked;
  final dynamic assignee;
  final List<dynamic> assignees;
  final dynamic milestone;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? closedAt;
  final String authorAssociation;
  final dynamic activeLockReason;
  final String body;
  final Reactions reactions;
  final String timelineUrl;
  final dynamic performedViaGithubApp;
  final int score;
  final bool draft;
  final PullRequest? pullRequest;

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
        url: json["url"],
        repositoryUrl: json["repository_url"],
        labelsUrl: json["labels_url"],
        commentsUrl: json["comments_url"],
        eventsUrl: json["events_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        nodeId: json["node_id"],
        number: json["number"],
        title: json["title"],
        user: UserModel.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: json["state"],
        locked: json["locked"],
        assignee: json["assignee"],
        assignees: List<dynamic>.from(json["assignees"].map((x) => x)),
        milestone: json["milestone"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"] == null
            ? null
            : DateTime.parse(json["closed_at"]),
        authorAssociation: json["author_association"],
        activeLockReason: json["active_lock_reason"],
        body: json["body"],
        reactions: Reactions.fromJson(json["reactions"]),
        timelineUrl: json["timeline_url"],
        performedViaGithubApp: json["performed_via_github_app"],
        score: json["score"],
        draft: json["draft"],
        pullRequest: json["pull_request"] == null
            ? null
            : PullRequest.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "repository_url": repositoryUrl,
        "labels_url": labelsUrl,
        "comments_url": commentsUrl,
        "events_url": eventsUrl,
        "html_url": htmlUrl,
        "id": id,
        "node_id": nodeId,
        "number": number,
        "title": title,
        "user": user.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "state": state,
        "locked": locked,
        "assignee": assignee,
        "assignees": List<dynamic>.from(assignees.map((x) => x)),
        "milestone": milestone,
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "closed_at": closedAt?.toIso8601String(),
        "author_association": authorAssociation,
        "active_lock_reason": activeLockReason,
        "body": body,
        "reactions": reactions.toJson(),
        "timeline_url": timelineUrl,
        "performed_via_github_app": performedViaGithubApp,
        "score": score,
        "draft": draft,
        "pull_request": pullRequest?.toJson(),
      };

  Issues toEntity() {
    return Issues(
      title: title,
      updatedAt: updatedAt,
      // user: user,
      id: id,
      state: state,
    );
  }

  @override
  List<Object?> get props => [
        url,
        repositoryUrl,
        labelsUrl,
        commentsUrl,
        eventsUrl,
        htmlUrl,
        id,
        nodeId,
        number,
        title,
        user,
        labels,
        state,
        locked,
        assignee,
        assignees,
        milestone,
        comments,
        createdAt,
        updatedAt,
        closedAt,
        authorAssociation,
        activeLockReason,
        body,
        reactions,
        timelineUrl,
        performedViaGithubApp,
        score,
        draft,
        pullRequest,
      ];
}

class Label extends Equatable {
  const Label({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    required this.labelDefault,
    required this.description,
  });

  final int id;
  final String nodeId;
  final String url;
  final String name;
  final String color;
  final bool labelDefault;
  final String description;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        name: json["name"],
        color: json["color"],
        labelDefault: json["default"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "url": url,
        "name": name,
        "color": color,
        "default": labelDefault,
        "description": description,
      };

  @override
  List<Object?> get props => [
        id,
        nodeId,
        url,
        name,
        color,
        labelDefault,
        description,
      ];
}

class PullRequest extends Equatable {
  const PullRequest({
    required this.url,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
    required this.mergedAt,
  });

  final String url;
  final String htmlUrl;
  final String diffUrl;
  final String patchUrl;
  final DateTime? mergedAt;

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
        url: json["url"],
        htmlUrl: json["html_url"],
        diffUrl: json["diff_url"],
        patchUrl: json["patch_url"],
        mergedAt: json["merged_at"] == null
            ? null
            : DateTime.parse(json["merged_at"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "html_url": htmlUrl,
        "diff_url": diffUrl,
        "patch_url": patchUrl,
        "merged_at": mergedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        url,
        htmlUrl,
        diffUrl,
        patchUrl,
        mergedAt,
      ];
}

class Reactions extends Equatable {
  const Reactions({
    required this.url,
    required this.totalCount,
    required this.the1,
    required this.reactions1,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  final String url;
  final int totalCount;
  final int the1;
  final int reactions1;
  final int laugh;
  final int hooray;
  final int confused;
  final int heart;
  final int rocket;
  final int eyes;

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        url: json["url"],
        totalCount: json["total_count"],
        the1: json["+1"],
        reactions1: json["-1"],
        laugh: json["laugh"],
        hooray: json["hooray"],
        confused: json["confused"],
        heart: json["heart"],
        rocket: json["rocket"],
        eyes: json["eyes"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "total_count": totalCount,
        "+1": the1,
        "-1": reactions1,
        "laugh": laugh,
        "hooray": hooray,
        "confused": confused,
        "heart": heart,
        "rocket": rocket,
        "eyes": eyes,
      };

  @override
  List<Object?> get props => [
        url,
        totalCount,
        the1,
        reactions1,
        laugh,
        hooray,
        confused,
        heart,
        rocket,
        eyes,
      ];
}
