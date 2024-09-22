import 'package:data/helper/data_helper.dart';

class UserPrincipal {
  bool isAvatar404 = false;
  DateTime? expireDate;
  int? departmentID;
  int? positionID;
  int? storeID;
  int? userID;
  List<int>? roleIDs;

  String? _nameDisplay;

  String? avatar;
  String? avatarFail;
  String? departmentName;
  String? fullname;

  String? get nameDisplay => _nameDisplay;
  String? positionName;

  String? refreshToken;
  String? storeName;
  String? token;
  String? username;
  String? vpnPassword;
  String? vpnUrl;
  String? vpnUsername;

  UserPrincipal();

  set nameDisplay(String? value) {
    List<String> words = fullname!.split(" ");
    String lastWord = words[words.length - 1];
    _nameDisplay = DataHelper.upperCaseFirst(pattern: lastWord);
  }

  UserPrincipal.fromJson(Map<String, dynamic> json) {
    avatar = json['Avatar'];
    departmentID = json['DepartmentID'];
    departmentName = json['DepartmentName'];
    fullname = json['Fullname'];
    nameDisplay = fullname;
    positionID = json['PositionID'];
    positionName = json['PositionName'];
    refreshToken = json['RefreshToken'];
    storeID = json['StoreID'];
    storeName = json['StoreName'];
    token = json['Token'];
    userID = json['UserID'];
    username = json['Username'];
    vpnPassword = json['VPNPassword'];
    vpnUrl = json['VPNUrl'];
    vpnUsername = json['VPNUsername'];

    if (json['ExpireDate'] != null) {
      expireDate = DataHelper.convertDatetimeJson(json['ExpireDate'], isCheckJsonNet: true);
    }

    if (json['RoleIDs'] != null) {
      roleIDs = json["RoleIDs"].cast<int>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Avatar'] = this.avatar;
    data['DepartmentID'] = this.departmentID;
    data['DepartmentName'] = this.departmentName;
    data['ExpireDate'] = this.expireDate.toString();

    data['Fullname'] = this.fullname;
    data['PositionID'] = this.positionID;
    data['PositionName'] = this.positionName;

    data['RefreshToken'] = this.refreshToken;
    data['RoleIDs'] = this.roleIDs;
    data['StoreID'] = this.storeID;
    data['StoreName'] = this.storeName;
    data['Token'] = this.token;
    data['UserID'] = this.userID;
    data['Username'] = this.username;
    data['VPNPassword'] = this.vpnPassword;
    data['VPNUrl'] = this.vpnUrl;
    data['VPNUsername'] = this.vpnUsername;

    return data;
  }

  bool IsInRole(int roleId) {
    var item = roleIDs!.contains(roleId);
    return item;
  }
}
