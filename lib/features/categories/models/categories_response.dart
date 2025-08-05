import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_tree_model.dart';

part 'categories_response.freezed.dart';
part 'categories_response.g.dart';

@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    required List<CategoryTreeModel> items,
    required int totalCount,
    required int page,
    required int pageSize,
    required int totalPages,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}
