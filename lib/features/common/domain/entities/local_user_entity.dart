import 'package:proschool/helpers/base_entity.dart';

class LocalUserEntity extends BaseEntity {
  int? idUserAssurance;
  int? idInfoUserAssurance;
  int? idUser;
  int? idAssureurInfo;
  int? montantOperation;
  int? dureeOperation;
  String? dateFin;
  String? dateOperation;
  int? satutOperation;

  LocalUserEntity();

  LocalUserEntity.create({
    this.idUserAssurance,
    this.idInfoUserAssurance,
    this.idUser,
    this.idAssureurInfo,
    this.montantOperation,
    this.dureeOperation,
    this.dateFin,
    this.dateOperation,
    this.satutOperation,
  });

  @override
  fromDatabase(Map<String, dynamic> json) {
    return LocalUserEntity.create(
        idUserAssurance: json['idAppUserAssurance'],
        idInfoUserAssurance: json['id_info_userassurance'],
        idUser: json['id_user'],
        idAssureurInfo: json['id_assureur_info'],
        montantOperation: json['montant_operation'],
        dureeOperation: json['duree_operation'],
        dateFin: json['date_fin'],
        dateOperation: json['date_operation'],
        satutOperation: json['satut_operation']);
  }

  @override
  factory LocalUserEntity.fromMap(Map<String, dynamic> json) {
    return LocalUserEntity.create(
        idUserAssurance: json['idAppUserAssurance'],
        idInfoUserAssurance: json['id_info_userassurance'],
        idUser: json['id_user'],
        idAssureurInfo: json['id_assureur_info'],
        montantOperation: json['montant_operation'],
        dureeOperation: json['duree_operation'],
        dateFin: json['date_fin'],
        dateOperation: json['date_operation'],
        satutOperation: json['satut_operation']);
  }

  @override
  Map<String, dynamic> toDatabase() {
    return {
      'id_info_userassurance': idInfoUserAssurance,
      'id_user': idUser,
      'id_assureur_info': idAssureurInfo,
      'montant_operation': montantOperation,
      'duree_operation': dureeOperation,
      'date_fin': dateFin,
      'date_operation': dateOperation,
      'satut_operation': satutOperation,
    };
  }
}
