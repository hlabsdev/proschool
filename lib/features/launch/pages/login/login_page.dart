import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proschool/core/utils/colors.dart';
import 'package:proschool/core/utils/preference.dart';
import 'package:proschool/features/common/data/dto/connection_dto.dart';
import 'package:proschool/features/common/data/models/config_model.dart';
import 'package:proschool/features/launch/pages/login/registration_page.dart';
import 'package:proschool/features/launch/pages/login/reset_password_page.dart';
import 'package:proschool/features/launch/widgets/validation_button.dart';
import 'package:proschool/features/launch/widgets/wave_curve.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../all_translations.dart';
import '../home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final ConnectionDto _connectionDto = ConnectionDto();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final AppSharedPreferences _appSharedPreferences = AppSharedPreferences();
  String _registrationId = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Wrap(
          // shrinkWrap: true,
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // alignment: Alignment.center,
          children: [
            //La curve
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: WaveClipper(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width,
                ),
                child: Container(
                  color: mainColor,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.width / 2,
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.width / 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ProSchool",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                    //Logo
                    // const Center(
                    //   child: Image(
                    //     image: AssetImage(
                    //       "assets/img/pafpe.png",
                    //     ),
                    //     height: 110.0,
                    //     width: 120.0,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            //Libelle
            // const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: MediaQuery.of(context).size.width / 8,
                child: Text(
                  "Connectez-vous",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: greyLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'ProductSans',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _phoneController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                formKey.currentState!.validate();
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Identifiant",
                contentPadding: Vx.m2,
                hintText: "Exemple : jonhdoe01",
                prefixIcon: const Icon(
                  Icons.person,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir votre identifiant';
                }
                return null;
              },
            ).p16(),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                formKey.currentState!.validate();
              },
              obscureText: _obscureText,
              decoration: InputDecoration(
                contentPadding: Vx.m2,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: "Mot de passe",
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    semanticLabel: _obscureText ? 'Voir' : 'Cacher',
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir votre mot de passe';
                }
                return null;
              },
            ).p16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegistrationPage()));
                    },
                    child: const Text(
                      "Creer un compte ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: mainColor),
                    ).p16(),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ResetPasswordPage()));
                    },
                    child: const Text("Mot de passe oublié ?",
                            textAlign: TextAlign.center)
                        .p16(),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 3),
            Align(
              alignment: Alignment.bottomCenter,
              child: ValidationButton(
                text: 'Submit',
                // color: mainBackground,
                width: MediaQuery.of(context).size.width / 1.1,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      extendBody: true,
    );
  }

  Future _getUserOtherInfo() async {
    _registrationId = await _appSharedPreferences.getRegistrationId();
  }

  _connexion(ConfigModel configModel) async {
    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(12),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(allTranslations.text('login_processing')),
                const SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                      FunctionUtils.colorFromHex(configModel.mainColor)),
                )
              ],
            ),
          );
        });

    Api api = ApiRepository();
    api.login(_connectionDto).then((value) {
      if (value.isRight()) {
        value.all((a) {
          if (a != null && a.status.compareTo("ok") == 0) {
            //enregistrement des informations de l'utilisateur dans la session
            UserInformationModel information = new UserInformationModel();
            information.id = a.id ?? 0;
            information.nom = a.nom;
            information.prenom = a.prenom;
            information.email = a.email;
            information.token = a.token;
            information.solde = a.solde;
            information.dateCreated = a.dateCreated;
            information.username = a.username;
            information.latitude = a.latitude;
            information.longitude = a.longitude;
            information.paysAlpha = a.paysAlpha;
            information.paysNom = a.paysNom;
            information.noteVendeur = a.noteVendeur;
            information.isfournisseur = a.isfournisseur;
            information.totalActeurs = a.totalActeurs;
            information.totalOffre = a.totalOffre;
            information.totalExperts = a.totalExperts;
            _appSharedPreferences.createLoginSession(information).then((value) {
              //enregistrement des meteos
              FunctionUtils.saveMeteo(a.meteos, information.id);

              //enregistrement des assurances
              FunctionUtils.saveAssurance(a.assurance);

              //enregistrement des assurances de lutilisateur
              FunctionUtils.saveUserAssurance(a.mesAssurances);

              //enregistrement des typeAssurance
              FunctionUtils.saveTypeAssurance(a.typeAssurance);

              //enregistrement des devises
              FunctionUtils.saveDevise(a.devises);

              //enregistrement des unites
              FunctionUtils.saveUnites(a.unites);

              //enregistrement des produits
              FunctionUtils.saveProduits(a.produits);

              //enregistrement des biztypes
              FunctionUtils.saveBiztype(a.biztypes);

              //enregistrement des sous_produits
              FunctionUtils.saveSousProduits(a.sousProduits);

              //enregistrement des speculations
              FunctionUtils.saveSpeculations(a.speculations, information.id);

              Navigator.of(context).pop(null);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ), ModalRoute.withName("/"));
            });

            return true;
          } else {
            Navigator.of(context).pop(null);
            _displaySnackBar(context, a.message);
            return false;
          }
        });
      } else {
        Navigator.of(context).pop(null);
        _displaySnackBar(context, allTranslations.text('error_process'));
        return false;
      }
    });*/
  }

  _displaySnackBar(BuildContext context, message) {
    message ??= "Opération en cours ...";
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
