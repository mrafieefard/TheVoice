# the_voice_client.api.ChannelsApi

## Load the API package
```dart
import 'package:the_voice_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createChannelApiChannelsPost**](ChannelsApi.md#createchannelapichannelspost) | **POST** /api/channels/ | Create Channel
[**getChannelsApiChannelsGet**](ChannelsApi.md#getchannelsapichannelsget) | **GET** /api/channels/ | Get Channels


# **createChannelApiChannelsPost**
> ChannelModel createChannelApiChannelsPost(channelPayload)

Create Channel

### Example
```dart
import 'package:the_voice_client/api.dart';

final api = TheVoiceClient().getChannelsApi();
final ChannelPayload channelPayload = ; // ChannelPayload | 

try {
    final response = api.createChannelApiChannelsPost(channelPayload);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChannelsApi->createChannelApiChannelsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **channelPayload** | [**ChannelPayload**](ChannelPayload.md)|  | 

### Return type

[**ChannelModel**](ChannelModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getChannelsApiChannelsGet**
> BuiltList<ChannelModel> getChannelsApiChannelsGet()

Get Channels

### Example
```dart
import 'package:the_voice_client/api.dart';

final api = TheVoiceClient().getChannelsApi();

try {
    final response = api.getChannelsApiChannelsGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChannelsApi->getChannelsApiChannelsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ChannelModel&gt;**](ChannelModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

