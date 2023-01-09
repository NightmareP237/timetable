import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:localization/localization.dart';
import 'package:timetable/forms/Login_Sreen.dart';
import 'package:timetable/sreens/onbord.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   // delegate from localization package.
      //   LocalJsonLocalization.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('fr', 'FR'),
      // ],
      title: 'TimeTable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:OnboardSreen(),
    );
  }
}

