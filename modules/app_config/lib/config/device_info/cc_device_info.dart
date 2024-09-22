import 'package:app_config/box/cc_hive_box.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cc_device_info.g.dart';

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

/// width, height, device name, imei, id...
@JsonSerializable()
@HiveType(typeId: CcHiveBox.device_type_id)
class CcDeviceInfo extends HiveObject {
  static late CcDeviceInfo instance;

  static Future<CcDeviceInfo?> register() async {
    Hive.registerAdapter(CcDeviceInfoAdapter());
    Box<CcDeviceInfo> box = await Hive.openBox<CcDeviceInfo>(CcHiveBox.device_info_box_name);
    CcDeviceInfo? model = box.get(CcHiveBox.key_default);
    if (model == null) {
      model = CcDeviceInfo();
      box.put(CcHiveBox.key_default, model);
    }
    instance = model;
    return model;
  }

  @HiveField(0)
  String? appVersion;

  @HiveField(1)
  String? deviceId;

  @HiveField(2)
  String? serialNumber;

  /// NOTICE : assert this value can not null after started from app_runner.dart
  /// otherwise, show error log in app tracking log
  @HiveField(3)
  double? deviceWidth;

  /// NOTICE : assert this value can not null after started from app_runner.dart
  /// otherwise, show error log in app tracking log
  @HiveField(4)
  double? deviceHeight;

  CcDeviceInfo({
    this.appVersion,
    this.deviceId,
    this.serialNumber,
    this.deviceWidth,
    this.deviceHeight,
  });

  Map<String, dynamic> toJson() => _$CcDeviceInfoToJson(this);
}
