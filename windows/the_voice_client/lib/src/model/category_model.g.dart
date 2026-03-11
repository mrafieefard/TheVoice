// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CategoryModel extends CategoryModel {
  @override
  final String id;
  @override
  final String name;

  factory _$CategoryModel([void Function(CategoryModelBuilder)? updates]) =>
      (CategoryModelBuilder()..update(updates))._build();

  _$CategoryModel._({required this.id, required this.name}) : super._();
  @override
  CategoryModel rebuild(void Function(CategoryModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryModelBuilder toBuilder() => CategoryModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryModel && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryModel')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class CategoryModelBuilder
    implements Builder<CategoryModel, CategoryModelBuilder> {
  _$CategoryModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CategoryModelBuilder() {
    CategoryModel._defaults(this);
  }

  CategoryModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryModel other) {
    _$v = other as _$CategoryModel;
  }

  @override
  void update(void Function(CategoryModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryModel build() => _build();

  _$CategoryModel _build() {
    final _$result = _$v ??
        _$CategoryModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'CategoryModel', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CategoryModel', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
