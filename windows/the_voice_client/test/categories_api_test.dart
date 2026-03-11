import 'package:test/test.dart';
import 'package:the_voice_client/the_voice_client.dart';

/// tests for CategoriesApi
void main() {
  final instance = TheVoiceClient().getCategoriesApi();

  group(CategoriesApi, () {
    // Create Category
    //
    //Future<CategoryModel> createCategoryApiCategoriesPost(CategoryPayload categoryPayload) async
    test('test createCategoryApiCategoriesPost', () async {
      // TODO
    });

    // Get Categories
    //
    //Future<BuiltList<CategoryModel>> getCategoriesApiCategoriesGet() async
    test('test getCategoriesApiCategoriesGet', () async {
      // TODO
    });
  });
}
