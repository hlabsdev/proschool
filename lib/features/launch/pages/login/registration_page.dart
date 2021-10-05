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

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //La curve
              Align(
                alignment: Alignment.topCenter,
                child: ClipPath(
                  clipper: WaveClipper(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width,
                  ),
                  child: Container(
                    color: mainColor,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.width / 3.5,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              //Titre et Logo
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 3.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "ProSchool",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'ProductSans',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Inscrivez-vous",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: greyLight,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'ProductSans',
                          ),
                        ),
                      ),
                      // Logo
                    ],
                  ),
                ),
              ),
              //Libelle
              // const SizedBox(height: 8),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
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
                          labelText: "Nom et Prenom",
                          contentPadding: Vx.m2,
                          hintText: "Exemple : AMEGAN Amevi",
                          prefixIcon: const Icon(
                            Icons.person_outline,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre nom complet';
                          }
                          return null;
                        },
                      ).p8(),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        controller: _phoneController,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          formKey.currentState!.validate();
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          labelText: "Telephone",
                          contentPadding: Vx.m2,
                          hintText: "Exemple : 22898660436",
                          prefixIcon: const Icon(
                            Icons.phone_enabled_outlined,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre numero de telephone';
                          }
                          return null;
                        },
                      ).p8(),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _phoneController,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          formKey.currentState!.validate();
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          labelText: "Email",
                          contentPadding: Vx.m2,
                          hintText: "Exemple : amevi@gmail.com",
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre email';
                          }
                          return null;
                        },
                      ).p8(),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
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
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                      ).p8(),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
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
                          "Deja Inscrit ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: mainColor),
                        ).p16(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
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
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width / 6),
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
