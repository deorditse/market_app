// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InfoOrderModel _$InfoOrderModelFromJson(Map<String, dynamic> json) {
  return _InfoOrderModel.fromJson(json);
}

/// @nodoc
mixin _$InfoOrderModel {
  String get name => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  String get id_order => throw _privateConstructorUsedError;
  String? get package => throw _privateConstructorUsedError;
  String? get marking_PartA => throw _privateConstructorUsedError;
  String? get marking_PartB => throw _privateConstructorUsedError;
  String? get dop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoOrderModelCopyWith<InfoOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoOrderModelCopyWith<$Res> {
  factory $InfoOrderModelCopyWith(
          InfoOrderModel value, $Res Function(InfoOrderModel) then) =
      _$InfoOrderModelCopyWithImpl<$Res, InfoOrderModel>;
  @useResult
  $Res call(
      {String name,
      String? foto,
      String place,
      String id_order,
      String? package,
      String? marking_PartA,
      String? marking_PartB,
      String? dop});
}

/// @nodoc
class _$InfoOrderModelCopyWithImpl<$Res, $Val extends InfoOrderModel>
    implements $InfoOrderModelCopyWith<$Res> {
  _$InfoOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? foto = freezed,
    Object? place = null,
    Object? id_order = null,
    Object? package = freezed,
    Object? marking_PartA = freezed,
    Object? marking_PartB = freezed,
    Object? dop = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      id_order: null == id_order
          ? _value.id_order
          : id_order // ignore: cast_nullable_to_non_nullable
              as String,
      package: freezed == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String?,
      marking_PartA: freezed == marking_PartA
          ? _value.marking_PartA
          : marking_PartA // ignore: cast_nullable_to_non_nullable
              as String?,
      marking_PartB: freezed == marking_PartB
          ? _value.marking_PartB
          : marking_PartB // ignore: cast_nullable_to_non_nullable
              as String?,
      dop: freezed == dop
          ? _value.dop
          : dop // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoOrderModelCopyWith<$Res>
    implements $InfoOrderModelCopyWith<$Res> {
  factory _$$_InfoOrderModelCopyWith(
          _$_InfoOrderModel value, $Res Function(_$_InfoOrderModel) then) =
      __$$_InfoOrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? foto,
      String place,
      String id_order,
      String? package,
      String? marking_PartA,
      String? marking_PartB,
      String? dop});
}

/// @nodoc
class __$$_InfoOrderModelCopyWithImpl<$Res>
    extends _$InfoOrderModelCopyWithImpl<$Res, _$_InfoOrderModel>
    implements _$$_InfoOrderModelCopyWith<$Res> {
  __$$_InfoOrderModelCopyWithImpl(
      _$_InfoOrderModel _value, $Res Function(_$_InfoOrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? foto = freezed,
    Object? place = null,
    Object? id_order = null,
    Object? package = freezed,
    Object? marking_PartA = freezed,
    Object? marking_PartB = freezed,
    Object? dop = freezed,
  }) {
    return _then(_$_InfoOrderModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      id_order: null == id_order
          ? _value.id_order
          : id_order // ignore: cast_nullable_to_non_nullable
              as String,
      package: freezed == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String?,
      marking_PartA: freezed == marking_PartA
          ? _value.marking_PartA
          : marking_PartA // ignore: cast_nullable_to_non_nullable
              as String?,
      marking_PartB: freezed == marking_PartB
          ? _value.marking_PartB
          : marking_PartB // ignore: cast_nullable_to_non_nullable
              as String?,
      dop: freezed == dop
          ? _value.dop
          : dop // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InfoOrderModel implements _InfoOrderModel {
  const _$_InfoOrderModel(
      {required this.name,
      this.foto,
      required this.place,
      required this.id_order,
      this.package,
      this.marking_PartA,
      this.marking_PartB,
      this.dop});

  factory _$_InfoOrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_InfoOrderModelFromJson(json);

  @override
  final String name;
  @override
  final String? foto;
  @override
  final String place;
  @override
  final String id_order;
  @override
  final String? package;
  @override
  final String? marking_PartA;
  @override
  final String? marking_PartB;
  @override
  final String? dop;

  @override
  String toString() {
    return 'InfoOrderModel(name: $name, foto: $foto, place: $place, id_order: $id_order, package: $package, marking_PartA: $marking_PartA, marking_PartB: $marking_PartB, dop: $dop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoOrderModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.id_order, id_order) ||
                other.id_order == id_order) &&
            (identical(other.package, package) || other.package == package) &&
            (identical(other.marking_PartA, marking_PartA) ||
                other.marking_PartA == marking_PartA) &&
            (identical(other.marking_PartB, marking_PartB) ||
                other.marking_PartB == marking_PartB) &&
            (identical(other.dop, dop) || other.dop == dop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, foto, place, id_order,
      package, marking_PartA, marking_PartB, dop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoOrderModelCopyWith<_$_InfoOrderModel> get copyWith =>
      __$$_InfoOrderModelCopyWithImpl<_$_InfoOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfoOrderModelToJson(
      this,
    );
  }
}

abstract class _InfoOrderModel implements InfoOrderModel {
  const factory _InfoOrderModel(
      {required final String name,
      final String? foto,
      required final String place,
      required final String id_order,
      final String? package,
      final String? marking_PartA,
      final String? marking_PartB,
      final String? dop}) = _$_InfoOrderModel;

  factory _InfoOrderModel.fromJson(Map<String, dynamic> json) =
      _$_InfoOrderModel.fromJson;

  @override
  String get name;
  @override
  String? get foto;
  @override
  String get place;
  @override
  String get id_order;
  @override
  String? get package;
  @override
  String? get marking_PartA;
  @override
  String? get marking_PartB;
  @override
  String? get dop;
  @override
  @JsonKey(ignore: true)
  _$$_InfoOrderModelCopyWith<_$_InfoOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
