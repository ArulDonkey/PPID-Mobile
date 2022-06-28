import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta extends Equatable {
  @JsonKey(name: 'site-sidebar-layout')
  final String? siteSidebarLayout;
  @JsonKey(name: 'site-content-layout')
  final String? siteContentLayout;
  @JsonKey(name: 'ast-global-header-display')
  final String? astGlobalHeaderDisplay;
  @JsonKey(name: 'ast-main-header-display')
  final String? astMainHeaderDisplay;
  @JsonKey(name: 'ast-hfb-above-header-display')
  final String? astHfbAboveHeaderDisplay;
  @JsonKey(name: 'ast-hfb-below-header-display')
  final String? astHfbBelowHeaderDisplay;
  @JsonKey(name: 'ast-hfb-mobile-header-display')
  final String? astHfbMobileHeaderDisplay;
  @JsonKey(name: 'site-post-title')
  final String? sitePostTitle;
  @JsonKey(name: 'ast-breadcrumbs-content')
  final String? astBreadcrumbsContent;
  @JsonKey(name: 'ast-featured-img')
  final String? astFeaturedImg;
  @JsonKey(name: 'footer-sml-layout')
  final String? footerSmlLayout;
  @JsonKey(name: 'theme-transparent-header-meta')
  final String? themeTransparentHeaderMeta;
  @JsonKey(name: 'adv-header-id-meta')
  final String? advHeaderIdMeta;
  @JsonKey(name: 'stick-header-meta')
  final String? stickHeaderMeta;
  @JsonKey(name: 'header-above-stick-meta')
  final String? headerAboveStickMeta;
  @JsonKey(name: 'header-main-stick-meta')
  final String? headerMainStickMeta;
  @JsonKey(name: 'header-below-stick-meta')
  final String? headerBelowStickMeta;
  @JsonKey(name: 'spay_email')
  final String? spayEmail;
  @JsonKey(name: 'jetpack_publicize_message')
  final String? jetpackPublicizeMessage;
  @JsonKey(name: 'jetpack_is_tweetstorm')
  final bool? jetpackIsTweetstorm;
  @JsonKey(name: 'jetpack_publicize_feature_enabled')
  final bool? jetpackPublicizeFeatureEnabled;

  const Meta({
    this.siteSidebarLayout,
    this.siteContentLayout,
    this.astGlobalHeaderDisplay,
    this.astMainHeaderDisplay,
    this.astHfbAboveHeaderDisplay,
    this.astHfbBelowHeaderDisplay,
    this.astHfbMobileHeaderDisplay,
    this.sitePostTitle,
    this.astBreadcrumbsContent,
    this.astFeaturedImg,
    this.footerSmlLayout,
    this.themeTransparentHeaderMeta,
    this.advHeaderIdMeta,
    this.stickHeaderMeta,
    this.headerAboveStickMeta,
    this.headerMainStickMeta,
    this.headerBelowStickMeta,
    this.spayEmail,
    this.jetpackPublicizeMessage,
    this.jetpackIsTweetstorm,
    this.jetpackPublicizeFeatureEnabled,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  Meta copyWith({
    String? siteSidebarLayout,
    String? siteContentLayout,
    String? astGlobalHeaderDisplay,
    String? astMainHeaderDisplay,
    String? astHfbAboveHeaderDisplay,
    String? astHfbBelowHeaderDisplay,
    String? astHfbMobileHeaderDisplay,
    String? sitePostTitle,
    String? astBreadcrumbsContent,
    String? astFeaturedImg,
    String? footerSmlLayout,
    String? themeTransparentHeaderMeta,
    String? advHeaderIdMeta,
    String? stickHeaderMeta,
    String? headerAboveStickMeta,
    String? headerMainStickMeta,
    String? headerBelowStickMeta,
    String? spayEmail,
    String? jetpackPublicizeMessage,
    bool? jetpackIsTweetstorm,
    bool? jetpackPublicizeFeatureEnabled,
  }) {
    return Meta(
      siteSidebarLayout: siteSidebarLayout ?? this.siteSidebarLayout,
      siteContentLayout: siteContentLayout ?? this.siteContentLayout,
      astGlobalHeaderDisplay:
          astGlobalHeaderDisplay ?? this.astGlobalHeaderDisplay,
      astMainHeaderDisplay: astMainHeaderDisplay ?? this.astMainHeaderDisplay,
      astHfbAboveHeaderDisplay:
          astHfbAboveHeaderDisplay ?? this.astHfbAboveHeaderDisplay,
      astHfbBelowHeaderDisplay:
          astHfbBelowHeaderDisplay ?? this.astHfbBelowHeaderDisplay,
      astHfbMobileHeaderDisplay:
          astHfbMobileHeaderDisplay ?? this.astHfbMobileHeaderDisplay,
      sitePostTitle: sitePostTitle ?? this.sitePostTitle,
      astBreadcrumbsContent:
          astBreadcrumbsContent ?? this.astBreadcrumbsContent,
      astFeaturedImg: astFeaturedImg ?? this.astFeaturedImg,
      footerSmlLayout: footerSmlLayout ?? this.footerSmlLayout,
      themeTransparentHeaderMeta:
          themeTransparentHeaderMeta ?? this.themeTransparentHeaderMeta,
      advHeaderIdMeta: advHeaderIdMeta ?? this.advHeaderIdMeta,
      stickHeaderMeta: stickHeaderMeta ?? this.stickHeaderMeta,
      headerAboveStickMeta: headerAboveStickMeta ?? this.headerAboveStickMeta,
      headerMainStickMeta: headerMainStickMeta ?? this.headerMainStickMeta,
      headerBelowStickMeta: headerBelowStickMeta ?? this.headerBelowStickMeta,
      spayEmail: spayEmail ?? this.spayEmail,
      jetpackPublicizeMessage:
          jetpackPublicizeMessage ?? this.jetpackPublicizeMessage,
      jetpackIsTweetstorm: jetpackIsTweetstorm ?? this.jetpackIsTweetstorm,
      jetpackPublicizeFeatureEnabled:
          jetpackPublicizeFeatureEnabled ?? this.jetpackPublicizeFeatureEnabled,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      siteSidebarLayout,
      siteContentLayout,
      astGlobalHeaderDisplay,
      astMainHeaderDisplay,
      astHfbAboveHeaderDisplay,
      astHfbBelowHeaderDisplay,
      astHfbMobileHeaderDisplay,
      sitePostTitle,
      astBreadcrumbsContent,
      astFeaturedImg,
      footerSmlLayout,
      themeTransparentHeaderMeta,
      advHeaderIdMeta,
      stickHeaderMeta,
      headerAboveStickMeta,
      headerMainStickMeta,
      headerBelowStickMeta,
      spayEmail,
      jetpackPublicizeMessage,
      jetpackIsTweetstorm,
      jetpackPublicizeFeatureEnabled,
    ];
  }
}
