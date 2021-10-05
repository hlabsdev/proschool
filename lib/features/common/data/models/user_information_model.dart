class UserInformationModel {
  int? id;
  String? nom;
  String? prenom;
  String? email;
  String? username;
  String? token;
  int? solde;
  String? latitude;
  String? dateCreated;
  String? longitude;
  String? paysAlpha;
  String? paysNom;
  int? noteVendeur;
  int? isfournisseur;
  String? totalActeurs;
  String? totalOffre;
  String? totalExperts;

  UserInformationModel();

  UserInformationModel.create({
    this.id,
    this.nom,
    this.prenom,
    this.dateCreated,
    this.email,
    this.token,
    this.solde,
    this.username,
    this.latitude,
    this.longitude,
    this.paysAlpha,
    this.paysNom,
    this.noteVendeur,
    this.isfournisseur,
    this.totalActeurs,
    this.totalOffre,
    this.totalExperts,
  });

  @override
  factory UserInformationModel.fromMap(Map<String, dynamic> json) {
    return UserInformationModel.create(
      id: json['id'],
      dateCreated: "$json['created_at']",
      nom: json['nom'],
      prenom: json['prenoms'],
      username: json['username'],
      email: json['email'],
      token: json['token'],
      solde: json['solde'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      paysAlpha: json['paysAlpha'],
      paysNom: json['paysNom'],
      noteVendeur: json['noteVendeur'],
      isfournisseur: json['isfournisseur'],
      totalActeurs: json['total_acteurs'],
      totalOffre: json['total_offres'],
      totalExperts: json['total_experts'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': dateCreated,
      'nom': nom,
      'prenoms': prenom,
      'username': username,
      'email': email,
      'token': token,
      'solde': solde,
      'latitude': latitude,
      'longitude': longitude,
      'paysAlpha': paysAlpha,
      'noteVendeur': noteVendeur,
      'isfournisseur': isfournisseur,
      'total_acteurs': totalActeurs,
      'total_offres': totalOffre,
      'total_experts': totalExperts,
    };
  }
}
