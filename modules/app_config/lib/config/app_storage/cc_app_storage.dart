import 'dart:async';

import 'package:app_config/box/cc_hive_box.dart';
import 'package:data/model/global/user_principal.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cc_app_storage.g.dart';

///
///[example update]-------------------------------------------------------------
///   CcAppStorage.instance.apply((_this) {
///       _this.token = "token_123";
///       _this.uuid = "uuid_123";
///
///       _this.save();
///   });
///[example logger]-------------------------------------------------------------
///   CcAppStorage.instance.Log();
///

@JsonSerializable()
@HiveType(typeId: CcHiveBox.application_type_id)
class CcAppStorage extends HiveObject {
  static late CcAppStorage instance;

  static Future<CcAppStorage?> register() async {
    Hive.registerAdapter(CcAppStorageAdapter());
    Box<CcAppStorage> box = await Hive.openBox<CcAppStorage>(CcHiveBox.application_box_name);
    CcAppStorage? model = box.get(CcHiveBox.key_default);

    /// is it existed? if not, init it
    if (model == null) {
      model = CcAppStorage();
      box.put(CcHiveBox.key_default, model);
    }
    instance = model;
    return model;
  }

  @HiveField(0)
  String? a_t;

  @HiveField(2)
  String? f_t;

  @HiveField(3)
  String? gps;

  @HiveField(4)
  String? role;

  CcAppStorage({
    this.a_t,
    this.f_t,
    this.gps,
    this.role,
  });

  ///
  UserPrincipal? user = UserPrincipal();
}
