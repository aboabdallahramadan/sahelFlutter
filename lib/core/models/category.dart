import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    required String id,
    required String title,
    required String image,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String title,
    required int adsCount,
    @Default([]) List<SubCategory> subcategories,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
