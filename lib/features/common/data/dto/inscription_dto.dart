class InscriptionDto {
  String? telephone;
  String? pwd;
  String? pays;
  String? addregion;
  String? region;
  String? email;
  String? accessToken;
  String? nom;
  String? prenoms;

  InscriptionDto();

  InscriptionDto.create({
    this.telephone,
    this.pwd,
    this.pays,
    this.addregion,
    this.region,
    this.email,
    this.accessToken,
    this.nom,
    this.prenoms,
  });

  @override
  factory InscriptionDto.fromMap(Map<String, dynamic> json) {
    return InscriptionDto.create(
      telephone: json['telephone'],
      pwd: json['pwd'],
      pays: json['pays'],
      addregion: json['addregion'],
      region: json['region'],
      email: json['email'],
      accessToken: json['access-token'],
      nom: json['email'],
      prenoms: json['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'telephone': telephone,
      'pwd': pwd,
      'pays': pays,
      'addregion': addregion,
      'region': region,
      'email': email,
      'access-token': accessToken,
      'nom': nom,
      'prenoms': prenoms,
    };
  }

  String toGetMap() {
    return "telephone=$telephone&pwd=$pwd&pays=$pays&addregion=$addregion&region=$region&email=$email&access-token=$accessToken&nom=$nom&prenoms=$prenoms";
  }
}
