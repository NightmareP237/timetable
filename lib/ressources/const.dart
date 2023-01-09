import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timetable/forms/fadding.dart';

const Color primaryMain = Color(0xff27DEBF);
const background = Color(0xffffffff);
const white = Color(0xfff2f2f2);
const black = Color(0xff121415);
Color errorMain = Color(0xffFF4842);
Color errorHover = Color(0xffFF6D68);
Color errorClick = Color(0xffCC3A35);
Color primaryText = Color(0xff242424);
Color secondaryText = Color(0xff121212);
Color disabledText = Color(0xffD3D3D3);
Color fieldColor = Color(0xffF8F8F8);
Color defaultBackgroundColor = Color(0xffFFFFFF);
Color shadowColor = Colors.black.withOpacity(.1);

class ColorApp {
  // static late Color shadowColor;
  // static late Color primaryText;
  static late Color secondaryText = Color(0xff121212);
  // static late Color disabledText;
  // static late Color fieldColor;
  // static late Color blackWhiteColor;
  // static late Color defaultBackgroundColor;

  static late Color separateColor;
  static late Color bagwhite;
  void init(BuildContext context) {
    primaryText = Theme.of(context).primaryColorLight;
    // secondaryText = Theme.of(context).primaryColorDark;
    // fieldColor = Theme.of(context).unselectedWidgetColor;
    // disabledText = Theme.of(context).disabledColor;
    // shadowColor = Theme.of(context).shadowColor;
    // defaultBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    // blackWhiteColor = Theme.of(context).cardColor;
    separateColor = Theme.of(context).canvasColor;
    bagwhite = Theme.of(context).primaryColorDark;
  }
}

TextStyle numcloudstyle(Color c) => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      fontFamily: 'SignikaNegative',
      color: c,
    );
TextStyle namestyle(Color c, double _f) => TextStyle(
      fontSize: _f * 16,
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(.8),
    );
nav(Widget navigate, BuildContext context, {bool close = false}) {
  close
      ? Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => navigate), (route) => false)
      : Navigator.push(
          context,
          SizeTransition1(
            navigate,
          ),
        );
}

TextStyle onBoardTextStyle(Color c) => TextStyle(
      color: c,
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w700,
      // height: 0.8,
      fontSize: 53,
    );
TextStyle titleStyle(Color c) => TextStyle(
      color: c,
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w700,
      // height: 0.64,
      fontSize: 24,
    );
TextStyle supertitleStyle(Color c) => TextStyle(
      color: c,
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w700,
      // height: 0.8,
      fontSize: 32,
    );
TextStyle subtitleStyle(Color c) => TextStyle(
    color: c,
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    overflow: TextOverflow.fade
    // height: 0.56,
    );
TextStyle bodyBoldStyle(Color c) => TextStyle(
      color: c,
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      // height: 0.48,
    );
TextStyle bodyStyle(Color c) => TextStyle(
    color: c,
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    // height: 0.48,
    inherit: false);
TextStyle bodyFieldStyle(Color c) => TextStyle(
      color: c,
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // textBaseline: TextBaseline.alphabetic
      // height: 15.0
    );
TextStyle bodyLightStyle(Color c) => TextStyle(
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w300,
    fontSize: 16,
    // height: 0.48,
    color: c);
TextStyle footnoteStyle(Color c) => TextStyle(
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w300,
    fontSize: 12,
    // height: 0.32,
    color: c);
TextStyle footfilterStyle(Color c) => TextStyle(
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    // height: 0.32,
    color: c);
TextStyle SeetingStyle(Color c) => TextStyle(
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w300,
    fontSize: 16,
    height: 0,
    color: c);
TextStyle overlineStyle(Color c) => TextStyle(
      fontFamily: 'SignikaNegative',
      fontWeight: FontWeight.w600,
      fontSize: 10,
      // height: 0.32,
      color: c,
    );
TextStyle buttonStyle(Color c) => TextStyle(
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    // height: 0.48,
    letterSpacing: 1,
    color: c);
TextStyle linkStyle(Color c) => TextStyle(
    fontFamily: 'SignikaNegative',
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: c);
TextStyle linkFootnoteStyle(Color c) {
  return TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      // height: 0.32,
      color: c);
}

Size mediaQuery(BuildContext context) => MediaQuery.of(context).size;

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String body,
    VoidCallback? method}) {
  // ignore: missing_return
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: subtitleStyle(ColorApp.secondaryText),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Center(
                    child: Text(
                      body,
                      // maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorApp.secondaryText,
                          fontFamily: 'SignikaNegative',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          inherit: false),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Divider(
                  height: 1,
                  color: ColorApp.secondaryText.withOpacity(0.5),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        method;
                      },
                      child: Text(
                        "termine".i18n(),
                        style: buttonStyle(primaryMain),
                      )),
                ),
              ],
            ),
          ),
        );
      });
}

Future<void> showDeleteUser(
    {required BuildContext context,
    required String title,
    required String body,
    VoidCallback? methodYes,
    VoidCallback? methodNo}) {
  // ignore: missing_return
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 24, left: 24, right: 24, bottom: 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: subtitleStyle(ColorApp.secondaryText),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Center(
                    child: Text(
                      body,
                      // maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorApp.secondaryText,
                          fontFamily: 'SignikaNegative',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          inherit: false),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Divider(
                  height: 1,
                  color: ColorApp.secondaryText.withOpacity(0.5),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            FocusScope.of(context).requestFocus(FocusNode());
                            methodNo;
                          },
                          child: Text(
                            "nodelete_text".i18n(),
                            style: buttonStyle(ColorApp.secondaryText),
                          )),
                      Container(height: 50, width: 1, color: Color(0xFFE1E1E1)),
                      TextButton(
                          onPressed: methodYes,
                          child: Text(
                            "yesdelete_text".i18n(),
                            style: buttonStyle(primaryMain),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget CustomAppBar(
        {required String label,
        required BuildContext context,
        bool search = false,
        bool iconback = true,
        bool hasIcon = false,
        bool hasRadius = true,
        bool hasShadow = true,
        String iconName = "search",
        Function(String)? searchTyping,
        VoidCallback? onTapIcon}) =>
    Container(
      height: search ? 160 : 103,
      width: double.infinity,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        borderRadius: hasRadius
            ? BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))
            : null,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 9,
                  spreadRadius: 4,
                  offset: Offset(2, 0),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  iconback
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).pop("isPop");
                          },
                          child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(top: 42, left: 16),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 25,
                              color: primaryMain,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 42, left: 16),
                          height: 60,
                        ),
                  Container(
                    // height: 28,
                    // width: mediaQuery(context).width / 1.15,
                    margin: const EdgeInsets.only(top: 38, left: 16),
                    child: Center(
                        child: Text(
                      label,
                      style: titleStyle(primaryMain),
                    )),
                  ),
                  // const Icon(Icons.filter)
                ],
              ),
              hasIcon
                  ? GestureDetector(
                      onTap: onTapIcon,
                      child: Container(
                        margin: const EdgeInsets.only(top: 42, right: 16),
                        child: Center(
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: SvgPicture.asset(
                              "assets/icons/$iconName.svg",
                              width: 25,
                              color: primaryMain,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
              // hasIcon
              //     ? GestureDetector(
              //         onTap: onTapIcon,
              //         child: Container(
              //           height: 60,
              //           margin: EdgeInsets.only(top: 42, left: 16),
              //           child: Icon(
              //             Icons.arrow_back_ios_new_rounded,
              //             size: 25,
              //             color: primaryMain,
              //           ),
              //         ),
              //       )
              //     : Container(
              //         margin: EdgeInsets.only(top: 42, left: 16),
              //         height: 60,
              //       ),
              // Container(
              //   height: 28,
              //   margin: EdgeInsets.only(top: 48, left: 16),
              //   child: Center(
              //       child: Text(
              //     label,
              //     style: subtitleStyle(ColorApp.primaryText),
              //   )
              //   ),
              // ),
            ],
          ),
          search
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
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
                      onChanged: searchTyping,
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
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: primaryMain,
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: errorMain,
                              width: 1,
                            )),
                        hintText: "search_filed_label".i18n(),
                        hintStyle: bodyLightStyle(ColorApp.secondaryText),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
