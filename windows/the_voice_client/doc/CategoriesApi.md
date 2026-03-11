# the_voice_client.api.CategoriesApi

## Load the API package
```dart
import 'package:the_voice_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCategoryApiCategoriesPost**](CategoriesApi.md#createcategoryapicategoriespost) | **POST** /api/categories/ | Create Category
[**getCategoriesApiCategoriesGet**](CategoriesApi.md#getcategoriesapicategoriesget) | **GET** /api/categories/ | Get Categories


# **createCategoryApiCategoriesPost**
> CategoryModel createCategoryApiCategoriesPost(categoryPayload)

Create Category

### Example
```dart
import 'package:the_voice_client/api.dart';

final api = TheVoiceClient().getCategoriesApi();
final CategoryPayload categoryPayload = ; // CategoryPayload | 

try {
    final response = api.createCategoryApiCategoriesPost(categoryPayload);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->createCategoryApiCategoriesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryPayload** | [**CategoryPayload**](CategoryPayload.md)|  | 

### Return type

[**CategoryModel**](CategoryModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCategoriesApiCategoriesGet**
> BuiltList<CategoryModel> getCategoriesApiCategoriesGet()

Get Categories

### Example
```dart
import 'package:the_voice_client/api.dart';

final api = TheVoiceClient().getCategoriesApi();

try {
    final response = api.getCategoriesApiCategoriesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CategoriesApi->getCategoriesApiCategoriesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CategoryModel&gt;**](CategoryModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

