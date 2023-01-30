// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfoOrderModel _$$_InfoOrderModelFromJson(Map<String, dynamic> json) =>
    _$_InfoOrderModel(
      name: json['name'] as String?,
      foto: json['foto'] as String?,
      place: json['place'] as String?,
      id_order: json['id_order'] as String?,
      package: json['package'] as String?,
      marking_PartA: json['marking_PartA'] as String?,
      marking_PartB: json['marking_PartB'] as String?,
      dop: json['dop'] as String?,
    );

Map<String, dynamic> _$$_InfoOrderModelToJson(_$_InfoOrderModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'foto': instance.foto,
      'place': instance.place,
      'id_order': instance.id_order,
      'package': instance.package,
      'marking_PartA': instance.marking_PartA,
      'marking_PartB': instance.marking_PartB,
      'dop': instance.dop,
    };
