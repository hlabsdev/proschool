import 'package:proschool/core/utils/connection_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final String lastUpdateRegion = "updateRegion";
  final String lastUpdateCountry = "updateCountry";
  final String lastUpdateAnnonce = "updateAnnonce";

  final String userLogin = "isLoggin";
  final String registrationId = "userRegistration";

  Future<String> getRegistrationId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(registrationId) ?? "";
  }

  Future<bool> setRegistrationId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(registrationId, value);
  }

  logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<ConnectionStatus> getConnectionState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool(userLogin) ?? false;

    if (isLogin == false) {
      return ConnectionStatus.disconnected;
    } else {
      return ConnectionStatus.connected;
    }
  }

  getApkConfig() {}
}
