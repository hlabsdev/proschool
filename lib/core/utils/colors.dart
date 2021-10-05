import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proschool/features/common/data/function_utils.dart';

const kTextLightColor = Color(0xFF959595);
const kTitleTextColor = Color(0xFF303030);
final kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = const Color(0xFF4056C6).withOpacity(.15);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);

const kSubTextStyle = TextStyle(fontSize: 16, color: kTextLightColor);
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);
const kTitleTextstyle = TextStyle(
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);

///Couleur principale ecritures et titres
// final mainColor = FunctionUtils.colorFromHex("#007AFF");
const mainColor = Color(0xFF9D1C24);

///Couleur bleu en haut et les boutons principales
// final mainColor = FunctionUtils.colorFromHex("#5770E7");
// final mainColor = FunctionUtils.colorFromHex("#9D1C29");
// const mainColor = Color(0xFF9D1C29);

// final secondColor = FunctionUtils.colorFromHex("#6E94FC");
///Couleur secondaire des boutons et element secondaires
const secondColor = Color(0xFFF5B03B);

// final mainBackground = FunctionUtils.colorFromHex("#FFFFFF");
// const mainBackground = Color(0xFFDEE5FF);
///Arriere plan blanc principale
const mainBackground = Color(0xFFFFFFFF);

///Arriere plan des card
const cardBackground = Color(0xFFFCFCFC);

///Arriere plan blanc principale
const appBarColor = Color(0xFFF5F5F5);

///Arriere plan gris du bottomAppbar
const bottomAppBarColor = Color(0xFFF5F5F5);

///Arriere plan des boite de dialogue
const dialogBackground = Color(0xFFDEE5FF);

///Couleur verte por les bagdes bouttons ect...
const greenLight = Color(0xFF32EF39);

///Couleur rouge por les bagdes bouttons ect...
const redLight = Color(0xFFFF4343);

///Couleur orange por les bagdes bouttons ect...
const orangeLight = Color(0xFFFFAA00);

///Couleur gris por les bagdes bouttons ect...
const greyLight = Color(0xFF999999);

///Couleur des ombres...
const shadowColor = Color(0xFFDCDCDC);
