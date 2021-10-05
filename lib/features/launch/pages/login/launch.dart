import 'package:flutter/material.dart';
import 'package:proschool/core/utils/colors.dart';
import 'package:proschool/features/launch/pages/login/login_page.dart';
import 'package:proschool/features/launch/pages/login/registration_page.dart';
import 'package:proschool/features/launch/widgets/validation_button.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bottomAppBarColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Titre et libelle
          Center(
            child: Column(
              children: [
                // Text(
                //   "ProSchool",
                //   style: TextStyle(
                //     color: mainColor,
                //     fontSize: 50,
                //     fontWeight: FontWeight.w700,
                //     fontFamily: 'ProductSans',
                //   ),
                // ),
                SizedBox(
                  width: 300,
                  height: MediaQuery.of(context).size.height / 4,
                  child: const Center(
                    child: Image(
                      image: AssetImage(
                        "assets/img/logo.png",
                      ),
                      // height: MediaQuery.of(context).size.width / 3.5,
                      // width: MediaQuery.of(context).size.width / 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Suivez vos apprenant apprants de pres grace a Proschool",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: greyLight,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          //Signup
          ValidationButton(
            text: 'Signup',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          //Login
          ValidationButton(
            text: 'Login',
            color: mainBackground,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
