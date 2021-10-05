import 'package:flutter/material.dart';
import 'package:proschool/all_translations.dart';
import 'package:proschool/core/utils/preference.dart';
import 'package:proschool/features/common/data/dto/connection_dto.dart';
import 'package:proschool/features/common/data/function_utils.dart';
import 'package:proschool/features/common/data/models/config_model.dart';
import 'package:proschool/features/launch/pages/login/login_page.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPage extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  ForgetPasswordPageState createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final ConnectionDto _connectionDto = ConnectionDto();
  final TextEditingController _phoneController = TextEditingController();

  final AppSharedPreferences _appSharedPreferences = AppSharedPreferences();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<ConfigModel>(
        builder: (context, configModel, child) {
          return Scaffold(
            key: widget._scaffoldKey,
            body: ListView(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white70, Colors.white70],
                    ),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(90)),
                    border: Border.all(
                        color:
                            FunctionUtils.colorFromHex(configModel.mainColor),
                        width: 2.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(height: 0,),
                    const Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage("assets/img/logo_long.png"),
                        height: 130,
                      ),
                    ),
                    //Spacer(),
                    const SizedBox(height: 15.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            //bottom: 32,
                            right: 32),
                        child: Text(
                          allTranslations.text('recover_pwd'),
                          style: TextStyle(
                              color: FunctionUtils.colorFromHex(
                                  configModel.mainColor),
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: const EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: FunctionUtils.colorFromHex(
                                configModel.mainColor),
                          ),
                          hintText: allTranslations.text('enter_number'),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (_phoneController.text.compareTo("") != 0) {
                          _connectionDto.telephone = _phoneController.text;
                          _forgetPassword(configModel);
                        } else {
                          _displaySnackBar(
                              context, allTranslations.text('emptyField'));
                        }
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FunctionUtils.colorFromHex(
                                    configModel.mainColor),
                                FunctionUtils.colorFromHex(
                                    configModel.mainColor),
                              ],
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            allTranslations.text('recover').toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(allTranslations.text('know_password')),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(allTranslations.text('login'),
                          style: TextStyle(
                              color: FunctionUtils.colorFromHex(
                                  configModel.mainColor))),
                    )
                  ]),
            ]),
          );
        },
      );

  _forgetPassword(ConfigModel configModel) async {
    /* showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(12),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(allTranslations.text('password_processing')),
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
    api.forgetPassord(_connectionDto).then((value) {
      if (value.isRight()) {
        value.all((a) {
          if (a.status.compareTo("ok") == 0) {
            Navigator.of(context).pop(null);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResetPasswordPage(
                      "${a.code}", "${_connectionDto.telephone}")),
            );
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
