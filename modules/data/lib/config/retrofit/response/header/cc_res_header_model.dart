import 'package:json_annotation/json_annotation.dart';

part 'cc_res_header_model.g.dart';

/// POPULAR REST API PARAMS
///
/// NOTICE : IT WORKS FOR THIS REST API TYPE
///
/// ex. : https://mockland.dev/api/news/list
///
/// {
///     "status": true,
///     "message": "News fetched",
///     "total": 196,
///     "data": [
///         {
///             "id": "clgsm9c6o00hivkuffqcoo5vo",
///             "title": "US stocks rise but close ",
///         },
///
@JsonSerializable()
class CcResHeaderModel {
  final bool status;
  // final bool error;
  final String message;

  /// POPULAR CASE : code = 0, (with httpStatusCode response = 2xx), it means http request is success
  final String? code;

  const CcResHeaderModel({
    required this.status,
    required this.message,
    this.code = '0',
  });

  factory CcResHeaderModel.fromJson(Map<String, dynamic> json) => _$CcResHeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CcResHeaderModelToJson(this);
}
