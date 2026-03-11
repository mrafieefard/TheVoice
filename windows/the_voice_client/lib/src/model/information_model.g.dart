// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InformationModel extends InformationModel {
  @override
  final String id;
  @override
  final String name;
  @override
  final String version;
  @override
  final String description;
  @override
  final String? serverIcon;

  factory _$InformationModel(
          [void Function(InformationModelBuilder)? updates]) =>
      (InformationModelBuilder()..update(updates))._build();

  _$InformationModel._(
      {required this.id,
      required this.name,
      required this.version,
      required this.description,
      this.serverIcon})
      : super._();
  @override
  InformationModel rebuild(void Function(InformationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InformationModelBuilder toBuilder() =>
      InformationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InformationModel &&
        id == other.id &&
        name == other.name &&
        version == other.version &&
        description == other.description &&
        serverIcon == other.serverIcon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, serverIcon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InformationModel')
          ..add('id', id)
          ..add('name', name)
          ..add('version', version)
          ..add('description', description)
          ..add('serverIcon', serverIcon))
        .toString();
  }
}

class InformationModelBuilder
    implements Builder<InformationModel, InformationModelBuilder> {
  _$InformationModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _serverIcon;
  String? get serverIcon => _$this._serverIcon;
  set serverIcon(String? serverIcon) => _$this._serverIcon = serverIcon;

  InformationModelBuilder() {
    InformationModel._defaults(this);
  }

  InformationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _version = $v.version;
      _description = $v.description;
      _serverIcon = $v.serverIcon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InformationModel other) {
    _$v = other as _$InformationModel;
  }

  @override
  void update(void Function(InformationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InformationModel build() => _build();

  _$InformationModel _build() {
    final _$result = _$v ??
        _$InformationModel._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'InformationModel', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'InformationModel', 'name'),
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'InformationModel', 'version'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'InformationModel', 'description'),
          serverIcon: serverIcon,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
