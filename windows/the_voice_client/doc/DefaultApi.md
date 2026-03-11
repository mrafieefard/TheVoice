# the_voice_client.api.DefaultApi

## Load the API package
```dart
import 'package:the_voice_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInformationApiInformationGet**](DefaultApi.md#getinformationapiinformationget) | **GET** /api/information | Get Information
[**healthCheckApiHealthGet**](DefaultApi.md#healthcheckapihealthget) | **GET** /api/health | Health Check


# **getInformationApiInformationGet**
> InformationModel getInformationApiInformationGet()

Get Information

### Example
```dart
import 'package:the_voice_client/api.dart';

final api = TheVoiceClient().getDefaultApi();

try {
    final response = api.getInformationApiInformationGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getInformationApiInformationGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InformationModel**](InformationModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **healthCheckApiHealthGet**
> JsonObject healthCheckApiHealthGet()

Health Check

Health check endpoint

### Example
```dart
import 'package:the_voice_client/api.dart';

final api = TheVoiceClient().getDefaultApi();

try {
    final response = api.healthCheckApiHealthGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->healthCheckApiHealthGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

