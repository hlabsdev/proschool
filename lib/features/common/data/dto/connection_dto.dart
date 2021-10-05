class ConnectionDto {
  String? telephone;
  //Stri?ng password;
  String? registrationId;
  String? code;
  String? secretCode;
  String? pwd;
  String? newPassword;
  String? oldPassword;
  String? accessToken;
  String? latitude;
  String? longitude;

  ConnectionDto();

  ConnectionDto.create({
    this.telephone,
    this.registrationId,
    this.code,
    this.pwd,
    this.secretCode,
    this.newPassword,
    this.oldPassword,
    this.accessToken,
    this.latitude,
    this.longitude,
  });

  @override
  factory ConnectionDto.fromMap(Map<String, dynamic> json) {
    return ConnectionDto.create(
      telephone: json['telephone'],
      registrationId: json['registrationId'],
      secretCode: json['secretCode'],
      code: json['code'],
      pwd: json['pwd'],
      accessToken: json['access-token'],
      newPassword: json['new_password'],
      oldPassword: json['old_password'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': telephone,
      'registrationId': registrationId,
      'pwd': pwd,
      'secretCode': secretCode,
      'code': code,
      'access-token': accessToken,
      'new_password': newPassword,
      'old_password': oldPassword,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  String toGetMap() {
    return "telephone=$telephone&pwd=$pwd&registrationId=$registrationId&code=$code&secretCode=$secretCode&access-token=$accessToken&new_password=$newPassword&old_password=$oldPassword&latitude=$latitude&longitude=$longitude";
  }
}
