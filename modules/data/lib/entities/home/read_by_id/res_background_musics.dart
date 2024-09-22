

class ResBackgroundMusics {
  ResBackgroundMusics({
    this.GalleryMediaId,
    this.title,
    this.mediaURL,
    this.mediaAbsoluteURL,
    this.media128URL,
    this.media128AbsoluteURL,
    this.isActive,
    this.sortOrder,
    this.mediaType,
    this.updatedDate,
    this.updatedUser,
    this.updatedUsername,
    this.updatedFullName,
  });

  ResBackgroundMusics.fromJson(dynamic json) {
    GalleryMediaId = json['GalleryMediaId'];
    title = json['Title'];
    mediaURL = json['MediaURL'];
    mediaAbsoluteURL = json['MediaAbsoluteURL'];
    media128URL = json['Media128URL'];
    media128AbsoluteURL = json['Media128AbsoluteURL'];
    isActive = json['IsActive'];
    sortOrder = json['SortOrder'];
    mediaType = json['MediaType'];
    updatedDate = json['UpdatedDate'];
    updatedUser = json['UpdatedUser'];
    updatedUsername = json['UpdatedUsername'];
    updatedFullName = json['UpdatedFullName'];
  }

  int? GalleryMediaId;
  String? title;
  String? mediaURL;
  String? mediaAbsoluteURL;
  String? media128URL;
  String? media128AbsoluteURL;
  bool? isActive;
  int? sortOrder;
  int? mediaType;
  String? updatedDate;
  int? updatedUser;
  String? updatedUsername;
  String? updatedFullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['GalleryMediaId'] = GalleryMediaId;
    map['Title'] = title;
    map['MediaURL'] = mediaURL;
    map['MediaAbsoluteURL'] = mediaAbsoluteURL;
    map['Media128URL'] = media128URL;
    map['Media128AbsoluteURL'] = media128AbsoluteURL;
    map['IsActive'] = isActive;
    map['SortOrder'] = sortOrder;
    map['MediaType'] = mediaType;
    map['UpdatedDate'] = updatedDate;
    map['UpdatedUser'] = updatedUser;
    map['UpdatedUsername'] = updatedUsername;
    map['UpdatedFullName'] = updatedFullName;
    return map;
  }
}
