import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/categories_service.dart';
import '../models/category_tree_model.dart';

// Categories provider using API
final categoriesApiProvider =
    FutureProvider<List<CategoryTreeModel>>((ref) async {
  final service = ref.watch(categoriesServiceProvider);
  final response = await service.getCategoriesTree(page: 1, pageSize: 100);

  if (response.success && response.data != null) {
    return response.data!.items;
  } else {
    throw Exception(response.message);
  }
});
