//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:the_voice_client/src/date_serializer.dart';
import 'package:the_voice_client/src/model/date.dart';

import 'package:the_voice_client/src/model/category_model.dart';
import 'package:the_voice_client/src/model/category_payload.dart';
import 'package:the_voice_client/src/model/channel_model.dart';
import 'package:the_voice_client/src/model/channel_payload.dart';
import 'package:the_voice_client/src/model/channel_type.dart';
import 'package:the_voice_client/src/model/http_validation_error.dart';
import 'package:the_voice_client/src/model/information_model.dart';
import 'package:the_voice_client/src/model/validation_error.dart';
import 'package:the_voice_client/src/model/validation_error_loc_inner.dart';

part 'serializers.g.dart';

@SerializersFor([
  CategoryModel,
  CategoryPayload,
  ChannelModel,
  ChannelPayload,
  ChannelType,
  HTTPValidationError,
  InformationModel,
  ValidationError,
  ValidationErrorLocInner,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CategoryModel)]),
        () => ListBuilder<CategoryModel>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ChannelModel)]),
        () => ListBuilder<ChannelModel>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
