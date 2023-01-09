import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timetable/sreens/HomeSreen.dart';

class dayplan {
  String cours;
  int credit;
  int nbreheure;
  String date;
  String phoneNumber;
  String semestre;
  String horaire;
  String titulaire;
  // List students;
  String description;
  String evaluation;
  String dayId;

  dayplan(
      {required this.dayId,
      required this.cours,
      required this.date,
      required this.nbreheure,
      required this.phoneNumber,
      required this.evaluation,
      required this.horaire,
      required this.credit,
      required this.description,
      // required this.students,
      required this.titulaire,
      required this.semestre});

  static List<dayplan> fromQuerySnapshot(QuerySnapshot querySnapshot) {
    List<dayplan> plans = [];
    for (final doc in querySnapshot.docs) {
      final plan = dayplan(
        dayId: doc.id,
        cours: doc["cours"],
        // students: doc["student-accept"][0],
        evaluation: doc["evaluation"],
        phoneNumber: doc["phoneNumber"],
        date: doc["date"],
        description: doc['description'],
        horaire: doc["horaire"],
        semestre: doc["semestre"],
        credit: doc["credit"],
        titulaire: doc["titulaire"],
        nbreheure: doc["nbre-d-heure"],
      );
      plans.add(plan);
      print(plans[0].dayId);
    }
    
    // end for
    return plans;
  }
   static  getdayplan(String plan)  {
    // StateSetter? setState, List<MasterRoutes>? masterRoutes) {
    final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
    List<dayplan> plans = [];
    firebaseInstance
        .collection(plan)
        .get()
        .then((QuerySnapshot routesQuerySnapshot) {
      plans = dayplan.fromQuerySnapshot(routesQuerySnapshot);
      // setState!(() {
      //   masterRoutes = routes;
      // });
      return plans;
    });

    // return routes;
  }

}
