import 'package:flutter/material.dart';
import 'package:proschool/all_translations.dart';
import 'package:proschool/core/utils/preference.dart';
import 'package:proschool/features/common/data/function_utils.dart';
import 'package:proschool/features/common/data/models/config_model.dart';
import 'package:provider/provider.dart';

import 'login/login_page.dart';
import 'login/registration_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  final AppSharedPreferences _appSharedPreferences = AppSharedPreferences();

  @override
  void initState() {
    super.initState();

    _getServerCountry();
    _getServerRegion();
  }

  @override
  Widget build(BuildContext context) => Consumer<ConfigModel>(
        builder: (context, configModel, child) {
          return Scaffold(
            backgroundColor: FunctionUtils.colorFromHex(configModel.mainColor),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/splash.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                //height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    const Center(
                      child: Image(
                        image: AssetImage("assets/img/logo_long.png"),
                      ),
                    ),

                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            color: FunctionUtils.colorFromHex(
                                configModel.mainColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            allTranslations.text('connexion').toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    //Spacer(),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            color: FunctionUtils.colorFromHex(
                                configModel.mainColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'Inscription'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      );

  _getServerRegion() async {
    /*_localRegionRepository.allRegion().then((response) {
      _appSharedPreferences.getLastUpdateRegion().then((value) {
        bool continueProcess = true;
        int currentLdate = DateTime.now().millisecondsSinceEpoch;
        if (value.compareTo("0") != 0) {
          if ((currentLdate - int.parse(value)) <
              DataConstantesUtils.REQUEST_SECONDE) {
            continueProcess = false;
          }
        }

        if (response.length == 0 ||
            (response.length > 0 && continueProcess == true)) {
          Api api = ApiRepository();
          api.getRegion().then((value) {
            if (value.isRight()) {
              value.all((a) {
                FunctionUtils.saveRegion(a);
                _appSharedPreferences.setLastUpdateRegion("$currentLdate");
                return true;
              });
            } else {
              return false;
            }
          });
        }
      });
    });*/
  }

  _getServerCountry() async {
    /*_localRegionRepository.allRegion().then((response) {
      _appSharedPreferences.getLastUpdateCountry().then((value) {
        bool continueProcess = true;
        int currentLdate = DateTime.now().millisecondsSinceEpoch;
        if (value.compareTo("0") != 0) {
          if ((currentLdate - int.parse(value)) <
              DataConstantesUtils.REQUEST_SECONDE) {
            continueProcess = false;
          }
        }

        if (response.length == 0 ||
            (response.length > 0 && continueProcess == true)) {
          Api api = ApiRepository();
          api.getCountry().then((value) {
            if (value.isRight()) {
              value.all((a) {
                FunctionUtils.saveCountry(a).then((value) {
                  _appSharedPreferences.setLastUpdateCountry("$currentLdate");
                });
                return true;
              });
            } else {
              return false;
            }
          });
        }
      });
    });*/
  }
}
