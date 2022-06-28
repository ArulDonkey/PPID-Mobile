// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Graph _$GraphFromJson(Map<String, dynamic> json) => Graph(
      type: json['@type'] as String?,
      id: json['@id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      sameAs:
          (json['sameAs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      description: json['description'] as String?,
      publisher: json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
      potentialAction: (json['potentialAction'] as List<dynamic>?)
          ?.map((e) => PotentialAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      inLanguage: json['inLanguage'] as String?,
      contentUrl: json['contentUrl'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      isPartOf: json['isPartOf'] == null
          ? null
          : IsPartOf.fromJson(json['isPartOf'] as Map<String, dynamic>),
      primaryImageOfPage: json['primaryImageOfPage'] == null
          ? null
          : PrimaryImageOfPage.fromJson(
              json['primaryImageOfPage'] as Map<String, dynamic>),
      datePublished: json['datePublished'] as String?,
      dateModified: json['dateModified'] as String?,
      breadcrumb: json['breadcrumb'] == null
          ? null
          : Breadcrumb.fromJson(json['breadcrumb'] as Map<String, dynamic>),
      itemListElement: (json['itemListElement'] as List<dynamic>?)
          ?.map((e) => ItemListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      headline: json['headline'] as String?,
      mainEntityOfPage: json['mainEntityOfPage'] == null
          ? null
          : MainEntityOfPage.fromJson(
              json['mainEntityOfPage'] as Map<String, dynamic>),
      wordCount: json['wordCount'] as int?,
      commentCount: json['commentCount'] as int?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      articleSection: (json['articleSection'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GraphToJson(Graph instance) => <String, dynamic>{
      '@type': instance.type,
      '@id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'sameAs': instance.sameAs,
      'logo': instance.logo,
      'image': instance.image,
      'description': instance.description,
      'publisher': instance.publisher,
      'potentialAction': instance.potentialAction,
      'inLanguage': instance.inLanguage,
      'contentUrl': instance.contentUrl,
      'width': instance.width,
      'height': instance.height,
      'isPartOf': instance.isPartOf,
      'primaryImageOfPage': instance.primaryImageOfPage,
      'datePublished': instance.datePublished,
      'dateModified': instance.dateModified,
      'breadcrumb': instance.breadcrumb,
      'itemListElement': instance.itemListElement,
      'author': instance.author,
      'headline': instance.headline,
      'mainEntityOfPage': instance.mainEntityOfPage,
      'wordCount': instance.wordCount,
      'commentCount': instance.commentCount,
      'thumbnailUrl': instance.thumbnailUrl,
      'articleSection': instance.articleSection,
    };
