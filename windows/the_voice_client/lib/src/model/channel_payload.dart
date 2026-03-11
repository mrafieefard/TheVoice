//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:the_voice_client/src/model/channel_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'channel_payload.g.dart';

/// ChannelPayload
///
/// Properties:
/// * [name]
/// * [description]
/// * [type]
/// * [categoryId]
@BuiltValue()
abstract class ChannelPayload
    implements Built<ChannelPayload, ChannelPayloadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'type')
  ChannelType get type;
  // enum typeEnum {  voice,  text,  };

  @BuiltValueField(wireName: r'category_id')
  String get categoryId;

  ChannelPayload._();

  factory ChannelPayload([void updates(ChannelPayloadBuilder b)]) =
      _$ChannelPayload;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChannelPayloadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChannelPayload> get serializer =>
      _$ChannelPayloadSerializer();
}

class _$ChannelPayloadSerializer
    implements PrimitiveSerializer<ChannelPayload> {
  @override
  final Iterable<Type> types = const [ChannelPayload, _$ChannelPayload];

  @override
  final String wireName = r'ChannelPayload';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChannelPayload object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(ChannelType),
    );
    yield r'category_id';
    yield serializers.serialize(
      object.categoryId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChannelPayload object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChannelPayloadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ChannelType),
          ) as ChannelType;
          result.type = valueDes;
          break;
        case r'category_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.categoryId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChannelPayload deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChannelPayloadBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
