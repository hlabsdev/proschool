class RegisterModel {
  String? status;
  String? message;
  int? code;

  RegisterModel();

  RegisterModel.create({
    this.status,
    this.message,
    this.code,
  });

  @override
  factory RegisterModel.fromMap(Map<String, dynamic> json) {
    return RegisterModel.create(
      status: json['status'],
      message: json['message'],
      code: json['code'],
    );

    /*
    return RegisterModel.create(
      status: json['status'],
      message: json['message'],
    );
  */
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'code': code,
    };
  }
}
