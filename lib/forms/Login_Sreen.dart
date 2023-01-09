import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:timetable/ressources/const.dart';
import 'package:timetable/services/auth.dart';
import 'package:timetable/widgets/loader.dart';
import 'package:timetable/widgets/tooltip.dart';

import '../sreens/HomeSreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen(
      {this.resetphone = '', this.resetpassword = '', this.isValidate = false});
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool isValidate = false;
  String resetphone;
  String resetpassword;
  bool isErrorPhone = false;
  bool isErrorPassword = false;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController phoneController = TextEditingController();
TextEditingController pwdController = TextEditingController();
bool isClicked = false;
String tenantDomain = "";
// initPref() async {
//   final prefs = await SharedPreferences.getInstance();
//   tenantDomain = prefs.getString('TenantDomain')!;
// }

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initPref();
  }

  @override
  Widget build(BuildContext context) {
    // ColorApp().init(context);
    print(widget.resetpassword);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: primaryMain,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                // height: mediaQuery(context).height,
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 120,
                ),
                child: Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bienvenue'.i18n(),
                          style: supertitleStyle(white)),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 328,
                        // width: 312,
                        width: double.infinity,
                        child: Card(
                            color: background,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Form(
                                key: widget.loginKey,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Matricule".i18n(),
                                        style:
                                            bodyStyle(ColorApp.secondaryText)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: fieldColor,
                                          border: widget.isErrorPhone
                                              ? Border.all(
                                                  color: errorMain,
                                                  width: 1,
                                                )
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: TextFormField(
                                            cursorColor: primaryMain,
                                            initialValue:
                                                widget.resetphone.isEmpty
                                                    ? widget.resetphone
                                                    : widget.resetphone,
                                            onChanged: ((value) => {
                                                  widget.resetphone = value,
                                                  collorfullButton()
                                                }),
                                            // keyboardType:
                                            //     TextInputType.numberWithOptions(
                                            //         signed: false,
                                            //         decimal: true),
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 12, bottom: 8),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4)),
                                                        borderSide: BorderSide(
                                                          color: primaryMain,
                                                          width: 1,
                                                        )),
                                                border: InputBorder.none,
                                                hintText:
                                                    "Entrer votre matricule".i18n()
                                                // : widget.resetphone
                                                ,
                                                hintStyle: bodyLightStyle(
                                                    ColorApp.secondaryText)))),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text("Mot de passe".i18n(),
                                        style:
                                            bodyStyle(ColorApp.secondaryText)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: widget.isErrorPassword
                                            ? Border.all(
                                                color: errorMain,
                                                width: 1,
                                              )
                                            : null,
                                        color: fieldColor,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: TextFormField(
                                        cursorColor: primaryMain,
                                        initialValue: widget.resetpassword,
                                        obscureText: true,
                                        onChanged: ((value) => {
                                              widget.resetpassword = value,
                                              collorfullButton()
                                            }),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 12, bottom: 8),
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                color: primaryMain,
                                                width: 1,
                                              )),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                color: errorMain,
                                                width: 1,
                                              )),
                                          hintText: "Entrer votre mot de passe".i18n(),
                                          hintStyle: bodyLightStyle(
                                              ColorApp.secondaryText),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) =>
                                        //             RestorePassword()));
                                      },
                                      child: Text(
                                        "Mot de passe oublie ?".i18n(),
                                        style: bodyStyle(primaryMain),
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        if (widget.resetphone.isEmpty ||
                                            widget.resetphone.length < 9) {
                                          setState(() {
                                            widget.isErrorPhone = true;
                                          });
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 3000), () {
                                            setState(() {
                                              widget.isErrorPhone = false;
                                            });
                                          });
                                        } else {}
                                        if (widget.resetpassword.isEmpty ||
                                            widget.resetpassword.length < 6) {
                                          setState(() {
                                            widget.isErrorPassword = true;
                                          });
                                          Future.delayed(
                                              Duration(milliseconds: 3000), () {
                                            setState(() {
                                              widget.isErrorPassword = false;
                                            });
                                          });
                                        } else {}
                                        if (widget.isValidate) {
                                          setState(() {
                                            isClicked = true;
                                          });
                                          bool log = await AuthServices().signIn(
                                              "${widget.resetphone}@iut.cm",
                                              // .signIn("${widget.resetphone}@$tenantDomain",
                                              widget.resetpassword);
                                          print(
                                              "${widget.resetphone}@iut.cm");
                                          if (log) {
                                            print("CorrectAuth");
                                            pwdController.clear();
                                            phoneController.clear();
                                            await getCurrentUserInfos(widget.resetphone)
                                                .then((value) => {
                                                      print(
                                                          'User has been getted ?' +
                                                              value
                                                                  .toString()),
                                            nav(HomePage(), context)
                                                     
                                            
                                            
                                            });
                                          } else {
                                            showAlertDialog(
                                                context: context,
                                                body: "Mot de passe ou Matricule incorrect .Veuillez reessayez !"
                                                    .i18n(),
                                                title: "Mot de passe incorrect !"
                                                    .i18n());
                                            print("WrongAuth");
                                            print(widget.resetpassword);
                                          }
                                        }
                                        setState(() {
                                          isClicked = false;
                                        });
                                        print(widget.resetphone +
                                            widget.resetpassword);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        // padding:
                                        //     EdgeInsets.only(
                                        //         top: 8),
                                        decoration: BoxDecoration(
                                          color: !widget.isValidate
                                              ? disabledText
                                              : primaryMain,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Connection".i18n(),
                                            style: buttonStyle(white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      widget.isErrorPhone
                          ? ToolTip(
                              label: "Plus de 09 caracteres sont requis!".i18n(),
                              position: "bottom")
                          : SizedBox(
                              height: 45,
                            ),
                      SizedBox(
                        height: 40,
                      ),
                      (widget.isErrorPassword)
                          ? ToolTip(
                              label: "Plus de 06 caracteres sont requis!".i18n(),
                              position: "bottom")
                          : SizedBox(
                              height: 50,
                            ),
                    ],
                  ),
                ]),
              ),
            ),
            if (isClicked) LoaderComponent(),
          ],
        ),
      ),
    );
  }

  collorfullButton() {
    if (widget.resetphone.length >= 9 && widget.resetpassword.length >= 6) {
      setState(() {
        widget.isValidate = true;
      });
    } else {
      setState(() {
        widget.isValidate = false;
      });
    }
  }
}
