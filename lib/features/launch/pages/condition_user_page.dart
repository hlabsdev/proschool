/*
import 'package:b2b_congo/core/utils/data_constantes_utils.dart';
import 'package:b2b_congo/allTranslations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

import 'package:provider/provider.dart';
import 'package:b2b_congo/features/common/data/models/config_model.dart';
import 'package:b2b_congo/features/common/data/function_utils.dart';



class ConditionUsePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageState();
  }
}



class PageState extends State<ConditionUsePage> {

  bool _visibleWebview;
  String _content="";



  @override
  void initState() {
    super.initState();
    _visibleWebview = false;
    _makePostRequest();
  }



  @override
  Widget build(BuildContext context) => Consumer<ConfigModel>(
    builder: (context, configModel, child) {
      return Scaffold(
        appBar: new AppBar(
          title:  Align(
            // alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(right: 50.0),
              alignment: Alignment.center,
              child: Text(allTranslations.text('titlecondition_use'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,

                ),
              ),
            ),
          ),
          backgroundColor:  FunctionUtils.colorFromHex(configModel.mainColor),
          elevation: 0.0,
        ),
        body: Stack(
            children: <Widget>[
              _visibleWebview==false ? Container(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(
                    backgroundColor:  FunctionUtils.colorFromHex(configModel.mainColor),
                    strokeWidth:2.0
                ),
              ):
              ListView(
                  padding: EdgeInsets.all( 20.0),
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.all(20.0),
                      child:Html(
                        data: _content,
                        //Optional parameters:
                        padding: EdgeInsets.all(8.0),
                        backgroundColor: Colors.white70,
                        defaultTextStyle: TextStyle(fontFamily: 'serif'),
                        linkStyle: const TextStyle(
                          color: Colors.redAccent,
                        ),
                        onLinkTap: (url) {
                          // open url in a webview
                        },
                        onImageTap: (src) {
                          // Display the image in large form.
                        },

                        customTextAlign: (dom.Node node) {
                          if (node is dom.Element) {
                            switch (node.localName) {
                              case "p":
                                return TextAlign.justify;
                            }
                          }
                        },
                        customTextStyle: (dom.Node node, TextStyle baseStyle) {
                          if (node is dom.Element) {
                            switch (node.localName) {
                              case "p":
                                return baseStyle.merge(TextStyle(height: 2, fontSize: 14));
                            }
                          }
                          return baseStyle;
                        },
                      ),
                    )
                  ])
            ]
        ),
      );
    },
  );


  _makePostRequest() {


    Dio dio = new Dio();
    dio.get(DataConstantesUtils.FULLCONDITION_SERVER_URL).then((response) {

      setState(() {
        _content=response.data.toString();
        _visibleWebview = true;
      });

    }).catchError((error){
    });


  }

}

*/
