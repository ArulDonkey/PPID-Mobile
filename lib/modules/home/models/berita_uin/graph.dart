import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'author.dart';
import 'breadcrumb.dart';
import 'image.dart';
import 'is_part_of.dart';
import 'item_list_element.dart';
import 'logo.dart';
import 'main_entity_of_page.dart';
import 'potential_action.dart';
import 'primary_image_of_page.dart';
import 'publisher.dart';

part 'graph.g.dart';

@JsonSerializable()
class Graph extends Equatable {
  @JsonKey(name: '@type')
  final String? type;
  @JsonKey(name: '@id')
  final String? id;
  final String? name;
  final String? url;
  final List<String>? sameAs;
  final Logo? logo;
  final Image? image;
  final String? description;
  final Publisher? publisher;
  final List<PotentialAction>? potentialAction;
  final String? inLanguage;
  final String? contentUrl;
  final int? width;
  final int? height;
  final IsPartOf? isPartOf;
  final PrimaryImageOfPage? primaryImageOfPage;
  final String? datePublished;
  final String? dateModified;
  final Breadcrumb? breadcrumb;
  final List<ItemListElement>? itemListElement;
  final Author? author;
  final String? headline;
  final MainEntityOfPage? mainEntityOfPage;
  final int? wordCount;
  final int? commentCount;
  final String? thumbnailUrl;
  final List<String>? articleSection;

  const Graph({
    this.type,
    this.id,
    this.name,
    this.url,
    this.sameAs,
    this.logo,
    this.image,
    this.description,
    this.publisher,
    this.potentialAction,
    this.inLanguage,
    this.contentUrl,
    this.width,
    this.height,
    this.isPartOf,
    this.primaryImageOfPage,
    this.datePublished,
    this.dateModified,
    this.breadcrumb,
    this.itemListElement,
    this.author,
    this.headline,
    this.mainEntityOfPage,
    this.wordCount,
    this.commentCount,
    this.thumbnailUrl,
    this.articleSection,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => _$GraphFromJson(json);

  Map<String, dynamic> toJson() => _$GraphToJson(this);

  Graph copyWith({
    String? type,
    String? id,
    String? name,
    String? url,
    List<String>? sameAs,
    Logo? logo,
    Image? image,
    String? description,
    Publisher? publisher,
    List<PotentialAction>? potentialAction,
    String? inLanguage,
    String? contentUrl,
    int? width,
    int? height,
    IsPartOf? isPartOf,
    PrimaryImageOfPage? primaryImageOfPage,
    String? datePublished,
    String? dateModified,
    Breadcrumb? breadcrumb,
    List<ItemListElement>? itemListElement,
    Author? author,
    String? headline,
    MainEntityOfPage? mainEntityOfPage,
    int? wordCount,
    int? commentCount,
    String? thumbnailUrl,
    List<String>? articleSection,
  }) {
    return Graph(
      type: type ?? this.type,
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      sameAs: sameAs ?? this.sameAs,
      logo: logo ?? this.logo,
      image: image ?? this.image,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      potentialAction: potentialAction ?? this.potentialAction,
      inLanguage: inLanguage ?? this.inLanguage,
      contentUrl: contentUrl ?? this.contentUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      isPartOf: isPartOf ?? this.isPartOf,
      primaryImageOfPage: primaryImageOfPage ?? this.primaryImageOfPage,
      datePublished: datePublished ?? this.datePublished,
      dateModified: dateModified ?? this.dateModified,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      itemListElement: itemListElement ?? this.itemListElement,
      author: author ?? this.author,
      headline: headline ?? this.headline,
      mainEntityOfPage: mainEntityOfPage ?? this.mainEntityOfPage,
      wordCount: wordCount ?? this.wordCount,
      commentCount: commentCount ?? this.commentCount,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      articleSection: articleSection ?? this.articleSection,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      type,
      id,
      name,
      url,
      sameAs,
      logo,
      image,
      description,
      publisher,
      potentialAction,
      inLanguage,
      contentUrl,
      width,
      height,
      isPartOf,
      primaryImageOfPage,
      datePublished,
      dateModified,
      breadcrumb,
      itemListElement,
      author,
      headline,
      mainEntityOfPage,
      wordCount,
      commentCount,
      thumbnailUrl,
      articleSection,
    ];
  }
}
