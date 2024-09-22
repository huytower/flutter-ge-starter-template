class UserDeviceCreateReq {
  int? userID;
  int? deviceType;
  String? deviceID;
  String? fCMToken;
  String? deviceName;

  UserDeviceCreateReq({
    this.userID,
    this.deviceType,
    this.deviceID,
    this.fCMToken,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['DeviceType'] = this.deviceType;
    data['DeviceID'] = this.deviceID;
    data['FCMToken'] = this.fCMToken;
    data['DeviceName'] = this.deviceName;
    return data;
  }
}

class CreateFcmLogReq {
  late List<CreateFcmLogDetailReq> Details;

  CreateFcmLogReq() {
    Details = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Details'] = this.Details.map((e) => e.toJson()).toList();
    return data;
  }
}

class CreateFcmLogDetailReq {
  String? DeviceID;
  String? FCMToken;
  String? FCMResult;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceID'] = this.DeviceID;
    data['FCMToken'] = this.FCMToken;
    data['FCMResult'] = this.FCMResult;
    return data;
  }
}
