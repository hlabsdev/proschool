/*
import 'dart:convert';
import 'dart:async';
import 'package:b2b_congo/allTranslations.dart';
import 'package:b2b_congo/features/common/data/models/config_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:b2b_congo/features/common/data/function_utils.dart';
import 'package:b2b_congo/core/utils/data_constantes_utils.dart';
import 'package:html/dom.dart' as dom;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {

  AboutPage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageState();
  }
}



class PageState extends State<AboutPage> with SingleTickerProviderStateMixin  {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;
  List<Tab> _myTabs;
  bool _visibleWebview;
  bool _visiblePartenaireview;
  String _content="";

  List<String> areaListData = <String>[];

  final hr = Divider(
    thickness: 1.0,
    color: Colors.black12,
  );



  @override
  void initState() {
    super.initState();


    _tabController = TabController(vsync: this, length: 2);
    _visibleWebview = false;
    _visiblePartenaireview = false;
    _getAboutInfo();
    _getPartenaireInfo();
  }


  @override
  Widget build(BuildContext context) => Consumer<ConfigModel>(
    builder: (context, configModel, child) {
      _myTabs = <Tab>[
        new Tab(text: "${allTranslations.text('menu_about')}"),
        new Tab(text: "${allTranslations.text('menu_partenaire')}"),
      ];

      return Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(

            centerTitle: true,
            title: Text( allTranslations.text('description_about'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            backgroundColor: FunctionUtils.colorFromHex(configModel.mainColor),
            elevation: 0.0,
          ),
          backgroundColor: Colors.white,
          body:Builder(
              builder: (BuildContext myContext)
              {
                return  Column(      // Column
                  children: <Widget>[

                    Container(
                      color:FunctionUtils.colorFromHex("dfdfdf"),        // Tab Bar color change
                      child: TabBar(           // TabBar
                        controller: _tabController,
                        unselectedLabelColor: FunctionUtils.colorFromHex("737373"),
                        labelColor: FunctionUtils.colorFromHex("020000"),
                        indicatorWeight: 3,
                        indicatorColor: FunctionUtils.colorFromHex(configModel.mainColor),
                        tabs: _myTabs,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TabBarView(         // Tab Bar View
                        physics: BouncingScrollPhysics(),
                        controller: _tabController,
                        children: <Widget>[
                          _aboutScreen(configModel),
                          _partenaireScreen(configModel),

                        ],
                      ),
                    ),
                  ],
                );
              }
          )

      );
    },
  );



  _aboutScreen(ConfigModel configModel){
    return Stack(
        children: <Widget>[
          _visibleWebview==false ? Container(
            alignment: FractionalOffset.center,
            child: CircularProgressIndicator(
                backgroundColor: FunctionUtils.colorFromHex(configModel.mainColor),
                strokeWidth:2.0
            ),
          ):
          ListView(
              padding: EdgeInsets.only(left:20.0,right:20.0,bottom:20.0),
              children: <Widget>[
                Container(

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
    );
  }

  _partenaireScreen(ConfigModel configModel){

    if(_visiblePartenaireview==false || areaListData.length<=0){
      return Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(
            backgroundColor:  FunctionUtils.colorFromHex(configModel.mainColor),
            strokeWidth:2.0
        ),
      );
    }else {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: GridView(
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 16, bottom: 16),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: List<Widget>.generate(
            areaListData.length,
                (int index) {
              return AreaView(
                imagepath: areaListData[index],
              );
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24.0,
            crossAxisSpacing: 24.0,
            childAspectRatio: 1.0,
          ),
        ),
      );
    }


  }

  _getPartenaireInfo(){

    Dio dio = new Dio();
    dio.get(DataConstantesUtils.FULLPARTENAIRE_SERVER_URL).then((response) {

      var data = response.toString();

      Map responseMap = jsonDecode(data);
      ResponseModel infoModel=ResponseModel.fromMap(responseMap);
      if(infoModel.status.compareTo("ok")==0){
        areaListData = <String>[];
        if(infoModel.partenaires.length>0) {
          for (int u = 0; u < infoModel.partenaires.length; u++) {
            areaListData.add(infoModel.partenaires[u].logo);


            if(u==(infoModel.partenaires.length-1)){
            //  Timer( Duration(seconds: 2), () {
                setState(() {
                  _visiblePartenaireview = true;
                });
              //});
            }
          }


        }

      }
    }).catchError((error){

    });

  }

  _getAboutInfo() {


    Dio dio = new Dio();
    dio.get(DataConstantesUtils.FULLABOUT_SERVER_URL).then((response) {

      setState(() {
        _content=response.data.toString();
        _visibleWebview = true;
      });

    }).catchError((error){
    });


  }

}


class ResponseModel {
  String status;
  List<PartenaireModel> partenaires;

  ResponseModel();

  ResponseModel.create({this.status, this.partenaires});

  @override
  factory ResponseModel.fromMap(Map<String, dynamic> json) {


    List<PartenaireModel> PartenaireList=null;
    var listPat = json['partenaires'] as List;
    if(listPat!=null) PartenaireList = listPat.map((i) => PartenaireModel.fromMap(i)).toList();

    return ResponseModel.create(
      status: json['status'],
      partenaires: PartenaireList
    );

  }

}

class PartenaireModel {
  String namePartenaire;
  String logo;
  int position;

  PartenaireModel();

  PartenaireModel.create({this.namePartenaire, this.logo, this.position});

  @override
  factory PartenaireModel.fromMap(Map<String, dynamic> json) {

    return PartenaireModel.create(
        namePartenaire: json['name_partenaire'],
        position: json['position'],
        logo: json['logo']
    );

  }

}


class AreaView extends StatelessWidget {
  const AreaView({
    Key key,
    this.imagepath,
  }) : super(key: key);

  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          splashColor: Color(0xFF2633C5).withOpacity(0.2),
          onTap: () {},
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: CachedNetworkImage(
                    imageUrl: '$imagepath',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    height: 125,
                   // width: 90,
                    //placeholder: (context, url) => new CircularProgressIndicator(),
                    placeholder: (context, url) => new Image.asset('assets/img/loading.gif',height:20),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                    //child: NetworkImage(imagepath)
                  //Image.asset(imagepath,height: 125),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/
