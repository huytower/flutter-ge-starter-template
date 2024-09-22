class ResSystemConfig {
  int? SCID;
  String? ConfigID;
  String? ConfigName;
  String? ConfigValue;
  int? ConfigType;
  int? ConfigCat;
  int? CreatedUser;
  String? CreatedUsername;
  String? CreatedDate;
  bool? IsDeleted;

  ResSystemConfig(
      {this.SCID,
      this.ConfigID,
      this.ConfigName,
      this.ConfigValue,
      this.ConfigType,
      this.ConfigCat,
      this.CreatedUser,
      this.CreatedUsername,
      this.CreatedDate,
      this.IsDeleted});

  ResSystemConfig.fromJson(Map<String, dynamic> json) {
    SCID = json['SCID'];
    ConfigID = json['ConfigID'];
    ConfigName = json['ConfigName'];
    ConfigValue = json['ConfigValue'];
//    ConfigType = json['ConfigType'];
//    ConfigCat = json['ConfigCat'];
//    CreatedUser = json['CreatedUser'];
//    CreatedUsername = json['CreatedUsername'];
//    CreatedDate = json['CreatedDate'];
//    IsDeleted = json['IsDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SCID'] = this.SCID;
    data['ConfigID'] = this.ConfigID;
    data['ConfigName'] = this.ConfigName;
    data['ConfigValue'] = this.ConfigValue;
    data['ConfigType'] = this.ConfigType;
    data['ConfigCat'] = this.ConfigCat;
    data['CreatedUser'] = this.CreatedUser;
    data['CreatedUsername'] = this.CreatedUsername;
    data['CreatedDate'] = this.CreatedDate;
    data['IsDeleted'] = this.IsDeleted;
    return data;
  }
}
