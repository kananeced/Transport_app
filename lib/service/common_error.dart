class ErrorData {
  bool? status;
  String? message;

  ErrorData({this.status, this.message});

  ErrorData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
