import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_tree_model.freezed.dart';
part 'category_tree_model.g.dart';

@freezed
class CategoryTreeModel with _$CategoryTreeModel {
  const factory CategoryTreeModel({
    required int id,
    required String name,
    required String imageUrl,
    @Default([]) List<SubCategoryModel> subCategories,
  }) = _CategoryTreeModel;

  factory CategoryTreeModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryTreeModelFromJson(json);
}

@freezed
class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    required int id,
    required String name,
    required String imageUrl,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
