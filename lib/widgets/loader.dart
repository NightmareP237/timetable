import 'package:flutter/material.dart';
import 'package:timetable/ressources/const.dart';

class LoaderComponent extends StatelessWidget {
  LoaderComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery(context).height,
      width: mediaQuery(context).width,
      color: Color(0xff161616).withOpacity(0.5),
      child: Center(
        child: Container(
          height: 96,
          width: 96,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: defaultBackgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: CircularProgressIndicator(
            color: primaryMain,
            backgroundColor: disabledText,
            strokeWidth: 2.8,
          ),
        ),
      ),
    );
  }
}
