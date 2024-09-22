/// Accept : "application/json"
/// ContextID : "0fa0ed40-7352-11ec-9e66-618108a4df72"
/// SessionID : null
/// content-type : "application/json; charset=utf-8"
/// Authorization : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIyMyIsIlVzZXJuYW1lIjoiMDM4NDYzMTMzOCIsIlVzZXJHVUlEIjoiZTczOGZiZjItOGZmMS00ZTM0LWFlZDMtNjg3NjEyYjRhZWI2IiwiRnVsbE5hbWUiOiJuZ3V54buFbiB2xINuIGjhuq11ICIsIkF2YXRhciI6IiIsIkdlbmRlciI6IjAiLCJEZXZpY2VJRCI6IkZGMDc5MDFFLTNFNTUtNDUwRS1BQjlBLTc0RjU0NzRBRkRDNyIsIlByb3ZpZGVyIjoicGhvbmUiLCJSZWZyZXNoVG9rZW4iOiJkMzJmY2U4ZTQxZGZiNjhkNjdjYTYwNGFiMzU3ZWI3OSIsIlJlZnJlc2hFeHBpcnlUaW1lIjoiMTY0NDU0NzY3OCIsIm5iZiI6MTY0MTk1NTY3OCwiZXhwIjoxNjQyMDI0MDc4LCJpYXQiOjE2NDE5NTU2Nzh9.C_ZQcKIWZ4dvUY0J5m-EpdyGAt8g-Vy5K1c4emYNsHU"

class HeaderModel {
  HeaderModel({
    this.accept,
    this.contextID,
    this.sessionID,
    this.contentType,
    this.authorization,
  });

  HeaderModel.fromJson(dynamic json) {
    accept = json['Accept'];
    contextID = json['ContextID'];
    sessionID = json['SessionID'];
    contentType = json['content-type'];
    authorization = json['Authorization'];
  }

  String? accept;
  String? contextID;
  dynamic sessionID;
  String? contentType;
  String? authorization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Accept'] = accept;
    map['ContextID'] = contextID;
    map['SessionID'] = sessionID;
    map['content-type'] = contentType;
    map['Authorization'] = authorization;
    return map;
  }
}
