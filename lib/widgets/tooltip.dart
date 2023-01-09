import 'package:flutter/material.dart';

import '../ressources/const.dart';

class ToolTip extends StatelessWidget {
  ToolTip({Key? key, required this.label, required this.position})
      : super(key: key);
  final String label;
  final String position;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (position.toLowerCase() == "top")
          Transform.rotate(
            angle: 135,
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                color: defaultBackgroundColor,
                height: 8,
                width: 10,
              ),
            ),
          ),
        Center(
          child: Container(
            // height: 40,
            width: 296,

            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: defaultBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(4),
            ),

            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: ColorApp.secondaryText,
                  fontFamily: 'SignikaNegative',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  // height: 0,
                  inherit: false,
                ),
                textAlign: TextAlign.center,
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        if (position == null || position.toLowerCase() == "bottom")
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              color: defaultBackgroundColor,
              height: 8,
              width: 10,
            ),
          ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
