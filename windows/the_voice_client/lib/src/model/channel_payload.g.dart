// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_payload.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChannelPayload extends ChannelPayload {
  @override
  final String name;
  @override
  final String description;
  @override
  final ChannelType type;
  @override
  final String categoryId;

  factory _$ChannelPayload([void Function(ChannelPayloadBuilder)? updates]) =>
      (ChannelPayloadBuilder()..update(updates))._build();

  _$ChannelPayload._(
      {required this.name,
      required this.description,
      required this.type,
      required this.categoryId})
      : super._();
  @override
  ChannelPayload rebuild(void Function(ChannelPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelPayloadBuilder toBuilder() => ChannelPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelPayload &&
        name == other.name &&
        description == other.description &&
        type == other.type &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChannelPayload')
          ..add('name', name)
          ..add('description', description)
          ..add('type', type)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class ChannelPayloadBuilder
    implements Builder<ChannelPayload, ChannelPayloadBuilder> {
  _$ChannelPayload? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ChannelType? _type;
  ChannelType? get type => _$this._type;
  set type(ChannelType? type) => _$this._type = type;

  String? _categoryId;
  String? get categoryId => _$this._categoryId;
  set categoryId(String? categoryId) => _$this._categoryId = categoryId;

  ChannelPayloadBuilder() {
    ChannelPayload._defaults(this);
  }

  ChannelPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _type = $v.type;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelPayload other) {
    _$v = other as _$ChannelPayload;
  }

  @override
  void update(void Function(ChannelPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChannelPayload build() => _build();

  _$ChannelPayload _build() {
    final _$result = _$v ??
        _$ChannelPayload._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ChannelPayload', 'name'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ChannelPayload', 'description'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'ChannelPayload', 'type'),
          categoryId: BuiltValueNullFieldError.checkNotNull(
              categoryId, r'ChannelPayload', 'categoryId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
