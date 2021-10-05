// ignore_for_file: non_constant_identifier_names

import 'package:proschool/core/utils/core_constantes.dart';

class DataConstantesUtils {
  static String DEVISE = "F CFA";
  static String CALLCENTER = "+(237) 222 21 14 33";
  static String simulationFolder = "Atico/prixMarche";
  static String PROJET_ID =
      "https://play.google.com/store/apps/details?id=com.clinsarlu.atico";
  static String TOKEN_SERVER = "CvdvXlAmzRbYmOPjfKnjCnBVWpxlJUwM";
  static String IMAGE_ANNONCE_URL =
      "$SERVER_URL/themes/site/agro_img/annonces/";
  static String SHARE_ANNONCE_URL = "$SERVER_URL/annonce/detail?reference=";

  static String LOGIN_SERVER_URL = "/api/web/mobilev1/users/login_user";
  static String RLOCATION_SERVER_URL = "/api/web/mobilev1/users/getchampclient";
  static String UPASSWORD_SERVER_URL = "/api/web/mobilev1/users/update_mdp";
  static String RPROFIL_SERVER_URL =
      "/api/web/mobilev1/users/update_user_infos";
  static String FREGISTER_SERVER_URL =
      "/api/web/mobilev1/users/suscribeclientconfirmation";
  static String REGISTER_SERVER_URL = "/api/web/mobilev1/users/suscribeclient";
  static String FORGET_SERVER_URL = "/api/web/mobilev1/users/resetmdp";
  static String RESET_SERVER_URL = "/api/web/mobilev1/users/resetconfirm";
  static String COUNTRY_SERVER_URL = "/api/web/mobilev1/pays/all";
  static String REGION_SERVER_URL = "/api/web/mobilev1/regions/allfirst";
  static String CONTACT_SERVER_URL = "/api/web/mobilev1/annonces/get_contact";
  static String PRICE_SERVER_URL = "/api/web/mobilev1/post-agents/all_price";
  static String ASPECULATION_SERVER_URL =
      "/api/web/mobilev1/alertes/abonnement_speculation";
  static String DSPECULATION_SERVER_URL =
      "/api/web/mobilev1/alertes/desabonnement_speculation";
  static String AMETEO_SERVER_URL = "/api/web/mobilev1/meteos/get_meteo";
  static String ASSURANCE_SERVER_URL =
      "/api/web/mobilev1/assurances/suscribe_info";

  static String ANNONCE_SERVER_URL = "/api/web/mobilev1/annonces/all";
  static String PANNONCE_SERVER_URL = "/api/web/mobilev1/annonces/send_annonce";

  static String FULLCONDITION_SERVER_URL =
      "$SERVER_URL/api/web/mobilev1/users/get_cgu";
  static String FULLABOUT_SERVER_URL =
      "$SERVER_URL/api/web/mobilev1/users/get_apropos";
  static String FULLPARTENAIRE_SERVER_URL =
      "$SERVER_URL/api/web/mobilev1/partenaires/all";
  static String FULLCONFIG_SERVER_URL =
      "$SERVER_URL/api/web/mobilev1/configs/all";

  static int APP_SERVER_PORT = 0;
  static int REQUEST_SECONDE = 30 * 60 * 60 * 1000;
}
