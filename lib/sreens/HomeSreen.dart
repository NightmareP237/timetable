import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:localization/localization.dart';
import 'package:timetable/models/usermodels.dart';
import 'package:timetable/ressources/const.dart';
import 'package:timetable/sreens/Staff_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/usermodels.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CollectionReference {}

bool loader = false;
String? firstName;
String? lastName;
String? userId;
String? matricule;
String password = "";
String? salle;
String filiere = "";
Users? currentUser;
planning? plann;
bool errorCar = false;
bool click = false;
Future<bool> getCurrentUserInfos(String userid) async {
  // userId = FirebaseAuth.instance.currentUser!.uid;
  print(userid);
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userid)
      .get()
      .then((DocumentSnapshot documentSnapshot) async {
    final Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;
    if (documentSnapshot.exists) {
      currentUser = Users.fromJson(data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('salle', currentUser!.salle);
      // Future<bool> getplanning() async {
      //   await FirebaseFirestore.instance
      //       .collection('time-day')
      //       .doc(currentUser!.salle)
      //       .get()
      //       .then((DocumentSnapshot documentSnapshot) async {
      //     final Map<String, dynamic> data =
      //         documentSnapshot.data() as Map<String, dynamic>;
      //     if (documentSnapshot.exists) {
      //       plann = planning(
      //           plan: data['planing-date'], students: data['students']);
      //       return true;
      //     } else {
      //       return false;
      //     }
      //   });
      //   return true;
      // }

      print(currentUser);
      return true;
    } else {
      return false;
    }
  });
  return true;
}

String salleid = "";
initPref() async {
  final prefs = await SharedPreferences.getInstance();
  salleid = prefs.getString('salle')!;
  print(salleid);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    initPref();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        loader = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContentApp();
  }
}

List data = [
  {
    // "img": "assets/images/e-booking.png",
    "day": "Lundi 09/01/2023",
    "moment": "Nombre d'etudiant 46"
  },
  {
    // "img": "assets/images/boxes.png",
    "day": "Mardi 10/01/2023",
    "moment": "Nombre d'etudiant 46"
  },
  {
    // "img": "assets/images/e-booking.png",
    "day": "Mercredi 11/01/2023",
    "moment": "Nombre d'etudiant 46"
  },
  {
    // "img": "assets/images/boxes.png",
    "day": "Jeudi 12/01/2023",
    "moment": "Nombre d'etudiant 46"
  },
  {
    // "img": "assets/images/e-booking.png",
    "day": "Vendredi 13/01/2023",
    "moment": "Nombre d'etudiant 46"
  },
  {
    // "img": "assets/images/boxes.png",
    "day": "Samedi 14/01/2023",
    "moment": "Nombre d'etudiant 46"
  }
];

class ContentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: AnimationLimiter(
                child: ListView(
                    // .builder(
                    padding: EdgeInsets.all(0),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    // itemCount: data.length,
                    // itemBuilder: (BuildContext context, int index) {
                    children: [
                      loader
                          ? SizedBox(
                              height: _w / 3.2,
                            )
                          : SizedBox(),
                      Column(
                        children: data
                            .map((e) => loader
                                ? AnimationConfiguration.staggeredList(
                                    position: data.length,
                                    delay: Duration(milliseconds: 100),
                                    child: SlideAnimation(
                                      duration: Duration(milliseconds: 2500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      verticalOffset: -250,
                                      child: ScaleAnimation(
                                        duration: Duration(milliseconds: 1500),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        child: Container(
                                          width: double.infinity,
                                          margin:
                                              EdgeInsets.only(bottom: _w / 20),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 40,
                                                spreadRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: cardWithInfoPage(
                                              e['day'], context, e['moment']),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: _w,
                                    height: mediaQuery(context).height,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: primaryMain,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ))
                            .toList(),
                      )
                    ]
                    // },
                    ),
              )),
          CustomAppBar(
              label: 'Time Table'.i18n(),
              context: context,
              hasIcon: false,
              iconback: false,
              search: false),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryMain,
          onPressed: () {
            // nav(PublishDocument(), context);
          },
          label: Text("Liste des etudiants".i18n())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget cardWithInfoPage(String name, BuildContext context, String publish) {
  return cardWidget(
    context,
    StaffManagementScreen(name: name,salle: salleid,),
    name,
    publish,
  );
}

Widget cardWidget(
    BuildContext context, Widget route, String name, String publish) {
  double _w = MediaQuery.of(context).size.width;
  double _f = MediaQuery.of(context).textScaleFactor;
  return InkWell(
    enableFeedback: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      HapticFeedback.lightImpact();
      nav(route, context);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, 0),
      height: _w / 5,
      padding: EdgeInsets.all(_w / 25),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _w / 2.0,
              // color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                    style: namestyle(Colors.black, _f),
                  ),
                  Text(
                    publish,
                    // overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: _f * 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _w / 6,
              decoration: BoxDecoration(
                border: Border.all(color: primaryMain, width: 0),
                // color: Colors.black.withOpacity(.2),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1), blurRadius: 30),
                ],
              ),
              child: Center(
                child: Text(
                  salleid,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
