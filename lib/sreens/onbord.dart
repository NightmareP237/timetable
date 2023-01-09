import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timetable/ressources/const.dart';
import 'package:timetable/services/StatutAuth.dart';
import 'package:timetable/widgets/Annimations/firstanimation.dart';

// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }

// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               'Suppose this is an app in your Phone\'s Screen page.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             OpenContainer(
//               closedBuilder: (_, openContainer) {
//                 return Container(
//                   height: 80,
//                   width: 80,
//                   child: Center(
//                     child: Text(
//                       'App Logo',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               openColor: Colors.white,
//               closedElevation: 20,
//               closedShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               transitionDuration: Duration(milliseconds: 700),
//               openBuilder: (_, closeContainer) {
//                 return SecondScreen();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class OnboardSreen extends StatefulWidget {
  @override
  _OnboardSreenState createState() => _OnboardSreenState();
}

class _OnboardSreenState extends State<OnboardSreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(Duration(milliseconds: 5000), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(Statut()));
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _width,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/icons/table.gif",
                          ),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain)),
                ),
                Text(
                  'Time Table',
                  style: numcloudstyle(primaryMain),
                ),
              ]),
        ],
      ),
    );
  }
}
