// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ChannelType _$voice = const ChannelType._('voice');
const ChannelType _$text = const ChannelType._('text');

ChannelType _$valueOf(String name) {
  switch (name) {
    case 'voice':
      return _$voice;
    case 'text':
      return _$text;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ChannelType> _$values =
    BuiltSet<ChannelType>(const <ChannelType>[
  _$voice,
  _$text,
]);

class _$ChannelTypeMeta {
  const _$ChannelTypeMeta();
  ChannelType get voice => _$voice;
  ChannelType get text => _$text;
  ChannelType valueOf(String name) => _$valueOf(name);
  BuiltSet<ChannelType> get values => _$values;
}

abstract class _$ChannelTypeMixin {
  // ignore: non_constant_identifier_names
  _$ChannelTypeMeta get ChannelType => const _$ChannelTypeMeta();
}

Serializer<ChannelType> _$channelTypeSerializer = _$ChannelTypeSerializer();

class _$ChannelTypeSerializer implements PrimitiveSerializer<ChannelType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'voice': 'voice',
    'text': 'text',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'voice': 'voice',
    'text': 'text',
  };

  @override
  final Iterable<Type> types = const <Type>[ChannelType];
  @override
  final String wireName = 'ChannelType';

  @override
  Object serialize(Serializers serializers, ChannelType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ChannelType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ChannelType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
