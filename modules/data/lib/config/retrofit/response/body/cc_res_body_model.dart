import 'dart:convert';

import 'package:app_config/enum/layout_status.dart';
import '../../params/cc_rest_api_params.dart';
import '../header/cc_res_header_model.dart';
import '../../../../entities/sample_code_fake_api/res_sample_code_fake_model.dart';

/// POPULAR RESTFUL API RESPONSE
///
/// NOTICE : IT WORKS FOR THIS REST API TYPE
///
/// - _resHeaderModel;  // include : (*) & (**) & (***)
/// - _resBody;  // include : (****)
///
/// ex.
/// {
///     "status": true,             (*)
///     "message": "News fetched",  (**)
///     "total": 196,               (***)
///     "data": [                   (****)
///     ...
///     ]
///  }

class CcResBodyModel<T> {
  CcResBodyModel();

  /// Http json mapping : header
  CcResHeaderModel? _resHeader; // (*) & (**) & (***)

  /// Http json mapping : body || data
  List<dynamic>? _resBodyList; // (****)
  Map<String, dynamic>? _resBodyObj; // (****)

  /// Http json mapping : body || data
  /// parsing to Model Object : CcResBodyModel,
  /// get more data,
  /// for resolving more logic
  T? firstElement;
  List<T>? listElements;

  /// progress
  LayoutStatus? layoutStatus = LayoutStatus.loading;

  ///
  /// parsing original data for get more detail data,
  /// serves for more logic
  ///
  /// ex. : var result = value.flatMap((map) => SampleCodeFakeModel.fromJson(map));
  ///
  CcResBodyModel<T> flatMapToList(T Function(Map<String, dynamic> element) getList) {
    listElements = [];

    if (_resBodyList == null || _resBodyList!.isEmpty) {
      return this;
    }

    _resBodyList!.forEach((e) {
      listElements!.add(getList(e));
    });

    firstElement = listElements?.first;

    return this;

    // TODO(huy): MOVE CODE
    /// handle layout status.
    // when(
    //   variable: _resHeaderModel?.code,
    //   conditions: {
    //     200: () {
    //       layoutStatus = LayoutStatus.success;
    //     },
    //     // 401: () {},
    //     // 400: () {},
    //   },
    //   orElse: () {
    //     layoutStatus = LayoutStatus.error;
    //   },
    // );
  }

  /// There are 2 response `data` types via RestApi service (from BE)
  /// - Object
  /// - List
  /// So, mobile apps also get :
  /// - _resBodyObj
  /// - _resBodyList (RECOMMEND|PREFER USE THIS)
  ///
  CcResBodyModel.fromJson(dynamic apiJson) {
    /// HEADER LAYER - REST API
    ///
    /// ex.
    ///
    /// { status: 200, message : , error:
    _resHeader = apiJson != null ? CcResHeaderModel.fromJson(apiJson) : null; // (*) & (**) & (***)

    final _resData = apiJson[CcRestApiParams.data.name];

    /// DATA LAYER - REST API
    ///
    /// ex.
    ///
    /// { data: []}
    ///
    /// WAY 1
    /// - Object
    /// - _resBodyList (RECOMMEND|PREFER USE THIS)
    if (_resData is List<dynamic>) {
      _resBodyList = _resData; // (****)

      return;
    }

    /// DATA LAYER - REST API
    ///
    /// ex.
    ///
    /// { data: {}}
    ///
    /// WAY 2
    /// - Object
    /// - _resBodyObj
    assert(_resData is Map<String, dynamic>);

    final map = _resData as Map<String, dynamic>;

    List? list = [];

    list.add(map);

    _resBodyList = list; // (****)
    _resBodyObj = map; // (****)
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    // (*) & (**) & (***)
    if (_resHeader != null) {
      map[CcRestApiParams.status.name] = _resHeader?.toJson();
    }

    // (****)
    if (_resBodyList != null) {
      map[CcRestApiParams.data.name] = _resBodyList?.map((v) => jsonEncode(v)).toList();
    }
    // (****)
    if (_resBodyObj != null) {
      map[CcRestApiParams.data.name] = _resBodyObj;
    }

    return map;
  }
}