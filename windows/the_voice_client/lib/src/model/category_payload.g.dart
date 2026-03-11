// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_payload.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CategoryPayload extends CategoryPayload {
  @override
  final String name;

  factory _$CategoryPayload([void Function(CategoryPayloadBuilder)? updates]) =>
      (CategoryPayloadBuilder()..update(updates))._build();

  _$CategoryPayload._({required this.name}) : super._();
  @override
  CategoryPayload rebuild(void Function(CategoryPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryPayloadBuilder toBuilder() => CategoryPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryPayload && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryPayload')..add('name', name))
        .toString();
  }
}

class CategoryPayloadBuilder
    implements Builder<CategoryPayload, CategoryPayloadBuilder> {
  _$CategoryPayload? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CategoryPayloadBuilder() {
    CategoryPayload._defaults(this);
  }

  CategoryPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryPayload other) {
    _$v = other as _$CategoryPayload;
  }

  @override
  void update(void Function(CategoryPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryPayload build() => _build();

  _$CategoryPayload _build() {
    final _$result = _$v ??
        _$CategoryPayload._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CategoryPayload', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
