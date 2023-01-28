import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io'; //delete for add new model File

part 'info_order_model.freezed.dart';

part 'info_order_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class InfoOrderModel with _$InfoOrderModel {
  const factory InfoOrderModel({
    required String name,
    String? foto,
    required String place,
    required String id_order,
    String? package,
    String? marking_PartA,
    String? marking_PartB,
    String? dop,
  }) = _InfoOrderModel;

  factory InfoOrderModel.fromJson(Map<String, Object?> json) =>
      _$InfoOrderModelFromJson(json);
}
