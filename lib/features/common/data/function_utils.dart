import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proschool/all_translations.dart';

class FunctionUtils {
  /*static Future<bool> saveAssurance(List<AssuranceModel> allAssurance) async {
    if (allAssurance != null) {
      //enregistrement des assurances
      LocalAssuranceRepository localAssuranceRepository =
          LocalAssuranceRepository();
      if (allAssurance.length > 0) {
        int nbreTotal = allAssurance.length;
        for (int i = 0; i < nbreTotal; i++) {
          LocalAssuranceEntity localAssuranceEntity =
              LocalAssuranceEntity.fromMap(allAssurance[i].toMap());

          //verifier si cette assurance existe deja
          localAssuranceRepository
              .existAssurance(localAssuranceEntity.apiId)
              .then((response) {
            if (response.length > 0) {
              localAssuranceEntity.idAssurance = response[0].idAssurance;
              localAssuranceRepository.update(
                  localAssuranceEntity, response[0].idAssurance);
            } else {
              localAssuranceEntity.idAssurance = 0;
              localAssuranceRepository.save(localAssuranceEntity);
            }
          });
        }
      }
    }
  }*/

  static Color colorFromHex(String? hexColor) {
    final hexCode = hexColor!.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static Color? getColorFromHex(String? hexColor) {
    hexColor = hexColor!.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  static MaterialColor createMaterialColor(String hexColor) {
    Color color = colorFromHex(hexColor);
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static String convertfDate(String timestamp) {
    String createDate = DateFormat('yyyy-MM-dd hh:mm aaa').format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000));
    var _alltabDate = createDate.split(' ');

    var _tabDate = _alltabDate[0].split('-');
    if (_tabDate.length == 3) {
      return "${_tabDate[2]} ${convertirMois(_tabDate[1])} ${_tabDate[0]} ${_alltabDate[1]}";
    } else {
      return "01 janvier 2019 00:00:00";
    }
  }

  static String convertFormat(String timestamp) {
    var _alltabDate = timestamp.split(' ');
    var _tabDate = _alltabDate[0].split('/');
    if (_tabDate.length == 3) {
      return "${_tabDate[2]}-${_tabDate[1]}-${_tabDate[0]}";
    } else {
      return "2020-01-01";
    }
  }

  static String disponibiliteDate(String timestamp) {
    var _alltabDate = timestamp.split(' ');
    var _tabDate = _alltabDate[0].split('/');
    if (_tabDate.length == 3) {
      return "${convertirMois(_tabDate[1])} ${_tabDate[2]}";
    } else {
      return "janvier 2019";
    }
  }

  static int concatDate(String timestamp) {
    var _alltabDate = timestamp.split(' ');
    var _tabDate = _alltabDate[0].split('/');
    if (_tabDate.length == 3) {
      return int.parse("${_tabDate[2]}${_tabDate[1]}${_tabDate[0]}");
    } else {
      return 0;
    }
  }

  static String convertDate(String timestamp) {
    String createDate = DateFormat('yyyy-MM-dd hh:mm aaa').format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000));
    var _alltabDate = createDate.split(' ');

    var _tabDate = _alltabDate[0].split('-');
    if (_tabDate.length == 3) {
      return "${_tabDate[2]} ${convertirMois(_tabDate[1])} ${_tabDate[0]}";
    } else {
      return "01 janvier 2019 00:00:00";
    }
  }

  static String convertFormatDate(String? dateRecup) {
    if (dateRecup != null || dateRecup != "") {
      var alltabDate = dateRecup!.split(' ');
      var tabDate = alltabDate[0].split('-');
      if (tabDate.length == 3) {
        return "${tabDate[2]} ${convertirMois(tabDate[1])} ${tabDate[0]}";
      } else {
        return "01 janvier 2019";
      }
    } else {
      return "01 janvier 2019";
    }
  }

  static String convertirMois(String mois) {
    String convertirMois = "";
    switch (int.parse(mois)) {
      case 1:
        convertirMois = allTranslations.text('month_1');
        break;
      case 2:
        convertirMois = allTranslations.text('month_2');
        break;
      case 3:
        convertirMois = allTranslations.text('month_3');
        break;
      case 4:
        convertirMois = allTranslations.text('month_4');
        break;
      case 5:
        convertirMois = allTranslations.text('month_5');
        break;
      case 6:
        convertirMois = allTranslations.text('month_6');
        break;
      case 7:
        convertirMois = allTranslations.text('month_7');
        break;
      case 8:
        convertirMois = allTranslations.text('month_8');
        break;
      case 9:
        convertirMois = allTranslations.text('month_9');
        break;
      case 10:
        convertirMois = allTranslations.text('month_10');
        break;
      case 11:
        convertirMois = allTranslations.text('month_11');
        break;
      case 12:
        convertirMois = allTranslations.text('month_12');
        break;
    }

    return convertirMois;
  }

  //
  // static Future<Position> getCurrentLocation() async {
  //   Position userposition;
  //   Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  //   await geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     userposition = position;
  //   }).catchError((e) {});
  //
  //   return userposition;
  // }

  static expireDate(int time, int duree) {
    int todaytime = DateTime.now().millisecondsSinceEpoch;

    duree = duree * 24 * 60 * 60 * 1000;

    if ((time * 1000 + duree) > todaytime) {
      int diffJour = (time * 1000 + duree) - todaytime;
      return "${diffJour ~/ (24 * 60 * 60 * 1000)} ${allTranslations.text('days')}";
    } else {
      return allTranslations.text('expired');
    }
  }

/*End*/
}
