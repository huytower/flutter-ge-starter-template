// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cc_res_header_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CcResHeaderModel _$CcResHeaderModelFromJson(Map<String, dynamic> json) =>
    CcResHeaderModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      code: json['code'] as String? ?? '0',
    );

Map<String, dynamic> _$CcResHeaderModelToJson(CcResHeaderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
