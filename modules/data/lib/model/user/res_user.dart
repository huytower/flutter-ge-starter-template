class ResUser {
  int? iD;
  int? positionID;
  String? uID;
  String? email;
  String? password;
  String? fullName;
  String? avatar;
  int? userTypeID;
  String? cusUID;
  String? lastChangePassword;
  bool? isActive;
  String? activeDate;
  bool? isLocked;
  String? lockedDate;
  bool? isRequireVerify;
  bool? enable2FA;
  String? secret2FAKey;
  String? createdUser;
  DateTime? createdDate;
  String? updatedUser;
  DateTime? updatedDate;
  bool? isDeleted;
  String? groupName;
  int? genderID;
  int? countryID;
  DateTime? birthDay;

  ResUser({
    this.iD,
    this.positionID,
    this.uID,
    this.email,
    this.password,
    this.fullName,
    this.avatar,
    this.userTypeID,
    this.cusUID,
    this.lastChangePassword,
    this.isActive,
    this.activeDate,
    this.isLocked,
    this.lockedDate,
    this.isRequireVerify,
    this.enable2FA,
    this.secret2FAKey,
    this.createdUser,
    this.createdDate,
    this.updatedUser,
    this.updatedDate,
    this.isDeleted,
    this.groupName,
    this.genderID,
    this.countryID,
    this.birthDay,
  });

  static int GetbyStoreId = 0;

  ResUser.fromJson(Map<String, dynamic> json, {int? type}) {
    iD = json['ID'];
    positionID = json['positionID'];
    uID = json['UID'];
    fullName = json['FullName'];
    if (type == GetbyStoreId) {
      return;
    }
    email = json['Email'];
    password = json['Password'];
    avatar = json['Avatar'];
    userTypeID = json['UserTypeID'];
    cusUID = json['CusUID'];
    lastChangePassword = json['LastChangePassword'];
    isActive = json['IsActive'];
    activeDate = json['ActiveDate'];
    isLocked = json['IsLocked'];
    lockedDate = json['LockedDate'];
    isRequireVerify = json['IsRequireVerify'];
    enable2FA = json['Enable2FA'];
    secret2FAKey = json['Secret2FAKey'];
    createdUser = json['CreatedUser'];
    createdDate = DateTime.parse(json['CreatedDate']);
    updatedUser = json['UpdatedUser'];
    updatedDate = DateTime.parse(json['UpdatedDate']);
    isDeleted = json['IsDeleted'];
    groupName = json['GroupName'];
    genderID = json['GenderID'];
    countryID = json['CountryID'];
    birthDay = DateTime.parse(json['BirthDay']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['positionID'] = this.positionID;
    data['UID'] = this.uID;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['FullName'] = this.fullName;
    data['Avatar'] = this.avatar;
    data['UserTypeID'] = this.userTypeID;
    data['CusUID'] = this.cusUID;
    data['LastChangePassword'] = this.lastChangePassword;
    data['IsActive'] = this.isActive;
    data['ActiveDate'] = this.activeDate;
    data['IsLocked'] = this.isLocked;
    data['LockedDate'] = this.lockedDate;
    data['IsRequireVerify'] = this.isRequireVerify;
    data['Enable2FA'] = this.enable2FA;
    data['Secret2FAKey'] = this.secret2FAKey;
    data['CreatedUser'] = this.createdUser;
    data['CreatedDate'] = this.createdDate.toString();
    data['UpdatedUser'] = this.updatedUser;
    data['UpdatedDate'] = this.updatedDate;
    data['IsDeleted'] = this.isDeleted;
    data['GroupName'] = this.groupName;
    data['GenderID'] = this.genderID;
    data['CountryID'] = this.countryID;
    data['BirthDay'] = this.birthDay.toString();
    return data;
  }
}

class UserStoreRes {
  int? UserID;
  String? Username;
  String? Fullname;
  int? PositionID;
  String? PositionName;
  int? StoreID;
  String? StoreName;
  String? AreaID;

  UserStoreRes();

  UserStoreRes.fromJson(Map<String, dynamic> json, {int? type}) {
    UserID = json['UserID'];
    Username = json['Username'];
    Fullname = json['Fullname'];
    PositionID = json['PositionID'];
    PositionName = json['PositionName'];
    StoreID = json['StoreID'];
    StoreName = json['StoreName'];
    AreaID = json['AreaID'];
  }
}
