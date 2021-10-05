class ConfigModel {
  String? mainColor;
  String? offreColor;
  String? demandeColor;
  String? bioColor;
  String? slogan1;
  String? slogan2;
  String? cancelColor;
  String? devise;
  String? callCenter;

  ConfigModel();

  ConfigModel.create({
    this.slogan1,
    this.slogan2,
    this.mainColor,
    this.offreColor,
    this.demandeColor,
    this.bioColor,
    this.cancelColor,
    this.devise,
    this.callCenter,
  });

  @override
  factory ConfigModel.fromMap(Map<String, dynamic> json) {
    return ConfigModel.create(
      slogan1: json['slogan1'],
      slogan2: json['slogan2'],
      mainColor: json['main_color'],
      offreColor: json['offre_color'],
      demandeColor: json['demande_color'],
      bioColor: json['bio_color'],
      cancelColor: json['cancel_color'],
      devise: json['devise'],
      callCenter: json['centre_appel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slogan1': slogan1,
      'slogan2': slogan2,
      'main_color': mainColor,
      'offre_color': offreColor,
      'demande_color': demandeColor,
      'bio_color': bioColor,
      'cancel_color': cancelColor,
      'devise': devise,
      'centre_appel': callCenter,
    };
  }
}
