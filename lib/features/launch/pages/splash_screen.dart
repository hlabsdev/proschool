import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proschool/core/utils/connection_status.dart';
import 'package:proschool/features/common/data/function_utils.dart';
import 'package:proschool/features/common/data/models/config_model.dart';
import 'package:proschool/features/launch/pages/first_page.dart';
import 'package:proschool/features/launch/pages/home_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Consumer<ConnectionStatus>(
                  builder: (context, connectionStatus, child) {
                    if (connectionStatus == ConnectionStatus.connected) {
                      // return AllAssurancePage();
                      return const HomePage();
                      //return AddAnnoncePage("0");
                    } else {
                      return const FirstPage();
                    }
                  },
                ))));
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
                child: const Center(
                  child: Image(
                    image: AssetImage("assets/img/logo_long.png"),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
