import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'about.dart';
import 'author.dart';
import 'collection.dart';
import 'cury.dart';
import 'predecessor_version.dart';
import 'reply.dart';
import 'self.dart';
import 'version_history.dart';
import 'wp_attachment.dart';
import 'wp_featuredmedia.dart';
import 'wp_term.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final List<Self>? self;
  final List<Collection>? collection;
  final List<About>? about;
  final List<Author>? author;
  final List<Reply>? replies;
  @JsonKey(name: 'version-history')
  final List<VersionHistory>? versionHistory;
  @JsonKey(name: 'predecessor-version')
  final List<PredecessorVersion>? predecessorVersion;
  @JsonKey(name: 'wp:featuredmedia')
  final List<WpFeaturedmedia>? wpFeaturedmedia;
  @JsonKey(name: 'wp:attachment')
  final List<WpAttachment>? wpAttachment;
  @JsonKey(name: 'wp:term')
  final List<WpTerm>? wpTerm;
  final List<Cury>? curies;

  const Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  Links copyWith({
    List<Self>? self,
    List<Collection>? collection,
    List<About>? about,
    List<Author>? author,
    List<Reply>? replies,
    List<VersionHistory>? versionHistory,
    List<PredecessorVersion>? predecessorVersion,
    List<WpFeaturedmedia>? wpFeaturedmedia,
    List<WpAttachment>? wpAttachment,
    List<WpTerm>? wpTerm,
    List<Cury>? curies,
  }) {
    return Links(
      self: self ?? this.self,
      collection: collection ?? this.collection,
      about: about ?? this.about,
      author: author ?? this.author,
      replies: replies ?? this.replies,
      versionHistory: versionHistory ?? this.versionHistory,
      predecessorVersion: predecessorVersion ?? this.predecessorVersion,
      wpFeaturedmedia: wpFeaturedmedia ?? this.wpFeaturedmedia,
      wpAttachment: wpAttachment ?? this.wpAttachment,
      wpTerm: wpTerm ?? this.wpTerm,
      curies: curies ?? this.curies,
    );
  }

  @override
  List<Object?> get props {
    return [
      self,
      collection,
      about,
      author,
      replies,
      versionHistory,
      predecessorVersion,
      wpFeaturedmedia,
      wpAttachment,
      wpTerm,
      curies,
    ];
  }
}
