class PagingResponse<T> {
  int? statusCode;
  String? errorMessage;
  int? totalRecord;
  int? currentPageIndex;
  int? pageSize;
  dynamic records;

  PagingResponse(
      {this.statusCode, this.errorMessage, this.totalRecord = 0, this.currentPageIndex, this.pageSize, this.records});

  PagingResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    errorMessage = json['ErrorMessage'];
    totalRecord = json['TotalRecord'];
    currentPageIndex = json['CurrentPageIndex'];
    pageSize = json['PageSize'];
    records = json['Records'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    data['ErrorMessage'] = this.errorMessage;
    data['TotalRecord'] = this.totalRecord;
    data['CurrentPageIndex'] = this.currentPageIndex;
    data['PageSize'] = this.pageSize;
    data['Records'] = this.records;
    return data;
  }
}
