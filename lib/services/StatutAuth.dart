import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetable/forms/Login_Sreen.dart';
import 'package:timetable/services/auth.dart';
import 'package:timetable/sreens/HomeSreen.dart';

class Statut extends StatefulWidget {
  Statut({Key? key}) : super(key: key);
  @override
  State<Statut> createState() => _StatutState();
}

class _StatutState extends State<Statut> {
  User? user;
  AuthServices auth = AuthServices();
  Future<void> getuser() async {
    final userResult = await auth.user;
    setState(() => user = userResult);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  Widget build(BuildContext context) {
    return (user!=null)? HomePage():LoginScreen();
  }
}
