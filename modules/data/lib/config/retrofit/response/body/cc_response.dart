import 'dart:convert';

import 'package:app_config/enum/layout_status.dart';
import 'package:widget/export/cc_ktx_export.dart';

@deprecated
class CcResponse<T> {
  StatusCode? status;

  List<dynamic>? _elements;
  T? firstElement;
  List<T>? listElements;
  LayoutStatus? layoutStatus = LayoutStatus.loading;

  CcResponse.loading();

  CcResponse.fromJson(dynamic json) {
    status = json['status'] != null ? StatusCode.fromJson(json['status']) : null;
    _elements = json['elements'] as List<dynamic>;
  }

  /// Using when call api success.
  CcResponse<T> convertToModel(T Function(Map<String, dynamic> element) create) {
    listElements = [];
    _elements?.forEach((element) {
      listElements!.add(create(element));
    });
    firstElement = listElements?.first;
    // handle layout status.
    when(
      variable: status?.code,
      conditions: {
        200: () {
          layoutStatus = LayoutStatus.success;
        },
        401: () {},
        400: () {},
      },
      orElse: () {
        layoutStatus = LayoutStatus.error;
      },
    );
    return this;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (_elements != null) {
      map['elements'] = _elements?.map((v) => jsonEncode(v)).toList();
    }
    return map;
  }
}

class StatusCode {
  bool? success;
  dynamic errors;
  int? code;

  StatusCode({
    bool? success,
    dynamic errors,
    int? code,
  }) {
    success = success;
    errors = errors;
    code = code;
  }

  StatusCode.fromJson(dynamic json) {
    success = json['success'];
    errors = json['errors'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['errors'] = errors;
    map['code'] = code;
    return map;
  }
}
