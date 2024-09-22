class ResAppBusinessVersion {
  String? name;
  int? iOS;
  int? android;

  ResAppBusinessVersion.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    iOS = json['IOS'];
    android = json['Android'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['IOS'] = this.iOS;
    data['Android'] = this.android;
    return data;
  }
}
