import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:timetable/models/planingdaymodel.dart';
import 'package:timetable/ressources/const.dart';
import 'package:timetable/widgets/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffManagementScreen extends StatefulWidget {
  StaffManagementScreen(
      {Key? key, this.userUpdate = false, this.name = '', this.salle = ''})
      : super(key: key);
  // final List<User> listU;
  String name;
  String salle;
  bool userUpdate;
  @override
  State<StaffManagementScreen> createState() => _StaffManagementScreenState();
}

// late String remote = FirebaseRemoteConfig.instance.getString("domain");
List<dayplan> plans = [];
bool refute = false;
bool participe = false;
bool ok = false;
bool abscent = false;
String? searchValue;

// List<MasterRoutes> masterRoutes = [];
class _StaffManagementScreenState extends State<StaffManagementScreen> {
  bool isLoad = false;
  // Customer? Cust;
  // // bool finishMasterRoute = true;
  // List<Customer> listCustomer = [];
  // List<Customer> searchCustomer = [];

  Future getCustomers() async {
    var Customers;
    try {
      // Customers = await APIService.getCustomers();
      print(Customers);
    } catch (e) {
      return false;
    }
    if (Customers != null) {
      // listCustomer.clear();
      // for (Map<String, dynamic> i in Customers) {
      //   setState(() {
      //     listCustomer.add(Customer.fromJson(i));
      //     searchCustomer = listCustomer;
      //     // isLoading = false;
      //     print(searchCustomer);
      //   });
      // }
    } else {
      return;
    }
  }

  // Future getUsers() async {
  //   var users;
  //   try {
  //     users = await APIService.getUsers();
  //     print(users);
  //   } catch (e) {
  //     return false;
  //   }
  //   if (users != null) {
  //     listUser.clear();

  //     for (Map<String, dynamic> i in users) {
  //       setState(() {
  //         listUser.add(User.fromJson(i));
  //         searchUser = listUser;
  //         // isLoading = false;
  //       });
  //     }
  //   } else {
  //     return;
  //   }
  // }

  // setFalse() {
  //   setState(() {
  //     isLoad = false;
  //   });
  // }

  getplanningday() {
    final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
    firebaseInstance
        .collection(
            "time-day/${widget.salle}/${widget.name.split(" ")[0].toLowerCase()}")
        .get()
        .then((QuerySnapshot optionsQuerySnapshot) {
      plans = dayplan.fromQuerySnapshot(optionsQuerySnapshot);
      print(plans);
      setState(() {
        isLoad = true;
      });
      return plans;
    });
    return plans;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
    getplanningday();
    // getMasterRoutes();
    // getUsers().then((value) => {setFalse()});
  }

  bool showButtons = true;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _f = MediaQuery.of(context).textScaleFactor;
    ColorApp().init(context);
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      if (kDebugMode) {
        print("visible staff");
      }
      showButtons = false;
    } else {
      if (kDebugMode) {
        print("Invisible staff");
      }
      showButtons = true;
    }
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: [
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
                      isLoad
                          ? SizedBox(
                              height: _w / 2.2,
                            )
                          : SizedBox(),
                      Column(
                        children: plans
                            .map((e) => isLoad
                                ? AnimationConfiguration.staggeredList(
                                    position: plans.length,
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
                                          child: InkWell(
                                            onLongPress: participe == false
                                                ? (() {
                                                    setState(() {
                                                      refute = !refute;
                                                    });
                                                    print(refute);
                                                  })
                                                : () {},
                                            enableFeedback: true,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: !refute
                                                ? () {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    // nav(route, context);
                                                    setState(() {
                                                      participe = !participe;
                                                    });
                                                  }
                                                : () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: (participe == true)
                                                    ? primaryMain
                                                        .withOpacity(.1)
                                                    : (refute == true ||
                                                            participe == true)
                                                        ? Colors.red
                                                            .withOpacity(.1)
                                                        : Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.04),
                                                      blurRadius: 30),
                                                ],
                                                border: Border.all(
                                                    color: (refute == true)
                                                        ? Colors.red
                                                            .withOpacity(.7)
                                                        : primaryMain,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              margin: EdgeInsets.fromLTRB(
                                                  _w / 25, 0, _w / 25, 0),
                                              height: _w / 1.8,
                                              padding: EdgeInsets.all(_w / 30),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: _w / 1.20,
                                                      // color: Colors.black,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                e.cours,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    primaryMain,
                                                                    _f),
                                                              ),
                                                              Text(
                                                                e.horaire,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    primaryMain,
                                                                    _f),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Jour:",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    Colors
                                                                        .black,
                                                                    _f),
                                                              ),
                                                              Text(
                                                                e.date,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    Colors
                                                                        .black,
                                                                    _f),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "titulaire:",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    Colors
                                                                        .black,
                                                                    _f),
                                                              ),
                                                              Text(
                                                                e.titulaire,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    Colors
                                                                        .black,
                                                                    _f),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "evaluation:",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    Colors
                                                                        .black,
                                                                    _f),
                                                              ),
                                                              Text(
                                                                e.evaluation,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                style: namestyle(
                                                                    primaryMain,
                                                                    _f),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "semestre:  ",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          _f *
                                                                              12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .6),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    e.semestre,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          _f *
                                                                              12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .6),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                e.date,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 1,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      _f * 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          .6),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Credit:  ",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          _f *
                                                                              12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .6),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    e.credit
                                                                        .toString(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          _f *
                                                                              12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .6),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Heure de cours:  ",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          _f *
                                                                              12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .6),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    e.nbreheure
                                                                        .toString(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          _f *
                                                                              12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .6),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          Text(
                                                            e.description,
                                                            // overflow: TextOverflow.ellipsis,
                                                            // softWrap: true,
                                                            // maxLines: 1,
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                              fontSize: _f * 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      .8),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   width: _w / 6,
                                                    //   decoration: BoxDecoration(
                                                    //     border: Border.all(color: primaryMain, width: 0),
                                                    //     // color: Colors.black.withOpacity(.2),
                                                    //     borderRadius: BorderRadius.circular(5),
                                                    //     boxShadow: [
                                                    //       BoxShadow(
                                                    //           color: Colors.black.withOpacity(.1), blurRadius: 30),
                                                    //     ],
                                                    //   ),
                                                    //   child: Center(
                                                    //     child: Text(
                                                    //       salleid,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
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
          // searchUser.isNotEmpty
          // ?
          // listUser.isNotEmpty
          //     ?
          // Padding(
          //   // padding: EdgeInsets.symmetric(vertical: 160.0),
          //   padding: EdgeInsets.only(top: 120.0, bottom: 16.0),
          //   child: CustomerProfile(
          //     name: widget.name.split(" ")[0],
          //     listCustomer: searchCustomer,
          //     searchValue: searchValue,
          //   ),
          // )
          // : Padding(
          //     padding: EdgeInsets.only(top: 230.0, bottom: 16.0),
          //     child: Container(
          //       height: 400,
          //       width: double.infinity,
          //       child: Center(
          //         child: Text(
          //           "network_error_text".i18n(),
          //           textAlign: TextAlign.center,
          //           style: bodyStyle((isLoad || finishMasterRoute)
          //               ? Colors.transparent
          //               : ColorApp.secondaryText),
          //         ),
          //       ),
          //     ),
          //   ),
          // ,
          // showButtons
          //     ? Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Container(
          //           height: 48,
          //           margin: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          //           decoration: BoxDecoration(
          //             boxShadow: [
          //               BoxShadow(
          //                 color: shadowColor,
          //                 blurRadius: 9,
          //                 spreadRadius: 4,
          //                 offset: Offset(0,12),
          //               ),
          //             ],
          //           ),
          //           child: ButtonCard(
          //             label: "add_new_user_text".i18n(),
          //             isOutline: false,
          //             onTap: () async {
          //               // Navigator.push(
          //               //   context,
          //               //   SizeTransition1(
          //               //     AddUserScreen(
          //               //       provider: "staff management",
          //               //       userCity: masterRoutes,
          //               //     ),
          //               //   ),
          //               // );
          //               // Navigator.of(context)
          //               //     .push(MaterialPageRoute(builder: (context) {
          //               //   return AddUserScreen();
          //               // }));
          //               nav(AddCustomer(), context);
          //             },
          //           ),
          //         ),
          //       )
          //     : SizedBox(),
          // CustomAppBar(
          //     label: "staff_management_label".i18n(),
          //     context: context,
          //     search: true),
          IntrinsicHeight(
            child: Container(
              // height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: defaultBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 9,
                    spreadRadius: 4,
                    offset: Offset(2, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // !(widget.userUpdate)
                          //     ?
                          Navigator.of(context).pop();
                          //     : nav(
                          //         BottomNavBar(
                          //           morepage: 4,
                          //         ),
                          //         context,
                          //         close: true);
                          setState(() {
                            participe = false;
                            refute = false;
                          });
                        },
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.only(top: 32, left: 16),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 25,
                            color: primaryMain,
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        margin: EdgeInsets.only(top: 38, left: 16),
                        child: Center(
                            child: Text(
                          '${widget.name}',
                          style: subtitleStyle(primaryMain),
                        )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      height: 40,
                      // width: 278,
                      decoration: BoxDecoration(
                        color: fieldColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: TextFormField(
                        cursorColor: primaryMain,
                        initialValue: "",
                        obscureText: false,
                        onChanged: ((value) => {
                              setState((() {
                                plans
                                    .where((element) => element.cours
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              })),
                              // print(searchCustomer)
                            }),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: mediaQuery(context).width * .03,
                              top: mediaQuery(context).width * .01,
                              bottom: mediaQuery(context).width * .005),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              width: 20,
                              color: black,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: primaryMain,
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: errorMain,
                                width: 1,
                              )),
                          hintText: "Rechercher...".i18n(),
                          hintStyle: bodyLightStyle(ColorApp.secondaryText),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (!isLoad)
            Container(
              width: _w,
              height: mediaQuery(context).height,
              child: Center(
                child: CircularProgressIndicator(
                  color: primaryMain,
                  strokeWidth: 2,
                ),
              ),
            ),
        ]),
      ),
      // bottomSheet: BottomSheet(
      //     onClosing: () {},
      //     builder: (_) {
      //       return Container(
      //         height: 200,
      //         color: primaryMain,
      //       );
      //     }),
      floatingActionButton: participe
          ? FloatingActionButton.extended(
              backgroundColor: primaryMain,
              onPressed: () {
                setState(() {
                  ok = true;
                });
                Future.delayed(Duration(seconds: 4), () {
                  setState(() {
                    ok = false;
                  });
                  setState(() {
                    refute = false;
                    participe = false;
                  });
                  Navigator.pop(context);
                  showAlertDialog(
                      context: context,
                      title: "Success",
                      body:
                          "Bravo, vous venez de suivre ces cours ! ");
                });
              },
              label: ok
                  ? Padding(
                      padding: EdgeInsets.all(15),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text("Participer"))
          : refute
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red.withOpacity(.8),
                  onPressed: () {
                    // nav(PublishDocument(), context);
                  },
                  label: Text("S'abscenter"))
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
