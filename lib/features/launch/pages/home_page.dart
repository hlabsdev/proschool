import 'package:flutter/material.dart';
import 'package:proschool/core/utils/colors.dart';
import 'package:proschool/features/launch/widgets/tile_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentIndex = 0;
  List<Widget> children = [];
  late DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    children = [
      // HomeMenu(),
      // OtherMenu("0"),
      // Parametres(),
    ];
    List<Widget> listIcon = [
      iconBtnAppbar(Icons.home_outlined, "Acueil", 0),
      iconBtnAppbar(Icons.people_outlined, "Mes Eleves", 1),
      iconBtnAppbar(Icons.chat_outlined, "Discussions", 2),
      iconBtnAppbar(Icons.notifications_outlined, "Notifis", 3),
      iconBtnAppbar(Icons.settings_outlined, "Parametres", 4),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          //With the curve
          ///profil
          Container(
            color: mainColor,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width / 3.5,
              // maxWidth: MediaQuery.of(context).size.width - 20,
            ),
            alignment: Alignment.topCenter,
            child: ListTile(
              visualDensity: VisualDensity.compact,
              horizontalTitleGap: 5,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              // dense: true,
              leading: const Icon(
                Icons.account_circle_rounded,
                size: 75,
                color: dialogBackground,
              ),
              // title:
              subtitle: Column(
                children: [
                  const SizedBox(height: 20),
                  //Titles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ///Name
                      WhiteTileText(
                        bold: true,
                        text: ('Nom: TAGADO Maxime'),
                        fontSize: 16,
                      ),

                      ///Score
                      WhiteTileText(
                        bold: true,
                        text: "Note generale",
                        fontSize: 16,
                      ),
                    ],
                  ),
                  //Subtitles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Classe
                      const WhiteTileText(
                        bold: false,
                        text: "Classe: 3 A",
                        fontSize: 14,
                      ),

                      ///Etoiles
                      SizedBox(
                        height: 20,
                        width: 90,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star,
                              color: orangeLight,
                              size: 18,
                            );
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,

                          // itemExtent: 3,
                          // cacheExtent: 3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Ecole
                      const WhiteTileText(
                        bold: false,
                        text: "Ecole: La Passion",
                        fontSize: 14,
                      ),

                      ///Notation
                      Container(
                        height: 20,
                        width: 90,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: appBarColor,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Note: 3.5/5",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // WhiteTileText(
                      //   bold: false,
                      //   text: "Score general",
                      //   fontSize: 14,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///List des menus
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              // padding: const EdgeInsets.only(top: 10),
              // margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(5, (index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        index.isEven
                            ? SizedBox(
                                height: MediaQuery.of(context).size.width / 5,
                                width: MediaQuery.of(context).size.width / 5,
                                child: Card(
                                  elevation: 5,
                                  color: index.isEven ? mainColor : secondColor,
                                  margin: const EdgeInsets.all(0),
                                  child: const Icon(
                                    Icons.file_copy_rounded,
                                    color: mainBackground,
                                    size: 50,
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5),
                                      right: Radius.zero,
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(0),
                                  child: ListTile(
                                    title: Text("Menu $index"),
                                    trailing: index.isEven
                                        ? const Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: mainColor)
                                        : null,
                                    leading: index.isEven
                                        ? null
                                        : const Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: mainColor),
                                    horizontalTitleGap: 1,
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    contentPadding: const EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                        index.isEven
                            ? Expanded(
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.zero,
                                      right: Radius.circular(5),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(0),
                                  child: ListTile(
                                    title: Text("Menu $index"),
                                    trailing: index.isEven
                                        ? const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: mainColor)
                                        : null,
                                    leading: index.isEven
                                        ? null
                                        : const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: mainColor),
                                    horizontalTitleGap: 1,
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    contentPadding: const EdgeInsets.all(5),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.width / 5,
                                width: MediaQuery.of(context).size.width / 5,
                                child: Card(
                                  elevation: 5,
                                  margin: const EdgeInsets.all(0),
                                  color: index.isEven ? mainColor : secondColor,
                                  child: const Icon(
                                    Icons.file_copy_rounded,
                                    color: mainBackground,
                                    size: 50,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listIcon,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget iconBtnAppbar(IconData icon, String title, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          curentIndex = index;
        });
      },
      iconSize: 50,
      tooltip: title,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
            color: curentIndex == index ? mainColor : greyLight,
          ),
          const SizedBox(height: 2),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 9,
                  fontWeight:
                      curentIndex == index ? FontWeight.w700 : FontWeight.w600,
                  color: curentIndex == index ? mainColor : greyLight),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    //Statement 1 Or statement2
    bool backButton = currentTime.difference(currentBackPressTime) >
        const Duration(seconds: 3);

    if (backButton) {
      currentBackPressTime = currentTime;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Double-cliquez pour quitter"),
        duration: Duration(seconds: 5),
      ));
      return false;
    }
    return true;
  }

/*End*/
}
