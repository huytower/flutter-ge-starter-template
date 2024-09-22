import 'package:app_config/box/cc_hive_box.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cc_app_track_log.g.dart';

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
///

@JsonSerializable()
@HiveType(typeId: CcHiveBox.app_track_log_type_id)
class CcAppTrackLog extends HiveObject {
  static late CcAppTrackLog instance;

  static Future<CcAppTrackLog?> register() async {
    Hive.registerAdapter(CcAppTrackLogAdapter());
    Box<CcAppTrackLog> box = await Hive.openBox<CcAppTrackLog>(CcHiveBox.app_track_log_box_name);
    CcAppTrackLog? model = box.get(CcHiveBox.key_default);
    if (model == null) {
      model = CcAppTrackLog();
      box.put(CcHiveBox.key_default, model);
    }
    instance = model;
    return model;
  }

  @HiveField(0)
  List<String>? msg;

  @HiveField(1)
  String? tag;

  CcAppTrackLog({
    this.msg,
    this.tag,
  });

  Map<String, dynamic> toJson() => _$CcAppTrackLogToJson(this);
}
