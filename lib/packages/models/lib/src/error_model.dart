class ErrorModel {
  ErrorModel({
    required this.detail,
  });
  late final String detail;

  ErrorModel.fromJson(Map<String, dynamic> json){
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['detail'] = detail;
    return _data;
  }
}