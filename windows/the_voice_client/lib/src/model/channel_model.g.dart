// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChannelModel extends ChannelModel {
  @override
  final String id;
  @override
  final String name;
  @override
  final ChannelType type;
  @override
  final DateTime createdAt;
  @override
  final String? description;
  @override
  final String? categoryId;

  factory _$ChannelModel([void Function(ChannelModelBuilder)? updates]) =>
      (ChannelModelBuilder()..update(updates))._build();

  _$ChannelModel._(
      {required this.id,
      required this.name,
      required this.type,
      required this.createdAt,
      this.description,
      this.categoryId})
      : super._();
  @override
  ChannelModel rebuild(void Function(ChannelModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelModelBuilder toBuilder() => ChannelModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelModel &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        createdAt == other.createdAt &&
        description == other.description &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChannelModel')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class ChannelModelBuilder
    implements Builder<ChannelModel, ChannelModelBuilder> {
  _$ChannelModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ChannelType? _type;
  ChannelType? get type => _$this._type;
  set type(ChannelType? type) => _$this._type = type;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _categoryId;
  String? get categoryId => _$this._categoryId;
  set categoryId(String? categoryId) => _$this._categoryId = categoryId;

  ChannelModelBuilder() {
    ChannelModel._defaults(this);
  }

  ChannelModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelModel other) {
    _$v = other as _$ChannelModel;
  }

  @override
  void update(void Function(ChannelModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChannelModel build() => _build();

  _$ChannelModel _build() {
    final _$result = _$v ??
        _$ChannelModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'ChannelModel', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ChannelModel', 'name'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'ChannelModel', 'type'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ChannelModel', 'createdAt'),
          description: description,
          categoryId: categoryId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
