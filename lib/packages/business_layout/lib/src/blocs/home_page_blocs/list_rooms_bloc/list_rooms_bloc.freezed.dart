// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_rooms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListRoomsState {
  List<String> get listRooms => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  String? get messageError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListRoomsStateCopyWith<ListRoomsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListRoomsStateCopyWith<$Res> {
  factory $ListRoomsStateCopyWith(
          ListRoomsState value, $Res Function(ListRoomsState) then) =
      _$ListRoomsStateCopyWithImpl<$Res, ListRoomsState>;
  @useResult
  $Res call({List<String> listRooms, String? room, String? messageError});
}

/// @nodoc
class _$ListRoomsStateCopyWithImpl<$Res, $Val extends ListRoomsState>
    implements $ListRoomsStateCopyWith<$Res> {
  _$ListRoomsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listRooms = null,
    Object? room = freezed,
    Object? messageError = freezed,
  }) {
    return _then(_value.copyWith(
      listRooms: null == listRooms
          ? _value.listRooms
          : listRooms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListRoomsStateCopyWith<$Res>
    implements $ListRoomsStateCopyWith<$Res> {
  factory _$$_ListRoomsStateCopyWith(
          _$_ListRoomsState value, $Res Function(_$_ListRoomsState) then) =
      __$$_ListRoomsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> listRooms, String? room, String? messageError});
}

/// @nodoc
class __$$_ListRoomsStateCopyWithImpl<$Res>
    extends _$ListRoomsStateCopyWithImpl<$Res, _$_ListRoomsState>
    implements _$$_ListRoomsStateCopyWith<$Res> {
  __$$_ListRoomsStateCopyWithImpl(
      _$_ListRoomsState _value, $Res Function(_$_ListRoomsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listRooms = null,
    Object? room = freezed,
    Object? messageError = freezed,
  }) {
    return _then(_$_ListRoomsState(
      listRooms: null == listRooms
          ? _value._listRooms
          : listRooms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ListRoomsState implements _ListRoomsState {
  const _$_ListRoomsState(
      {final List<String> listRooms = const [], this.room, this.messageError})
      : _listRooms = listRooms;

  final List<String> _listRooms;
  @override
  @JsonKey()
  List<String> get listRooms {
    if (_listRooms is EqualUnmodifiableListView) return _listRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRooms);
  }

  @override
  final String? room;
  @override
  final String? messageError;

  @override
  String toString() {
    return 'ListRoomsState(listRooms: $listRooms, room: $room, messageError: $messageError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListRoomsState &&
            const DeepCollectionEquality()
                .equals(other._listRooms, _listRooms) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_listRooms), room, messageError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListRoomsStateCopyWith<_$_ListRoomsState> get copyWith =>
      __$$_ListRoomsStateCopyWithImpl<_$_ListRoomsState>(this, _$identity);
}

abstract class _ListRoomsState implements ListRoomsState {
  const factory _ListRoomsState(
      {final List<String> listRooms,
      final String? room,
      final String? messageError}) = _$_ListRoomsState;

  @override
  List<String> get listRooms;
  @override
  String? get room;
  @override
  String? get messageError;
  @override
  @JsonKey(ignore: true)
  _$$_ListRoomsStateCopyWith<_$_ListRoomsState> get copyWith =>
      throw _privateConstructorUsedError;
}
