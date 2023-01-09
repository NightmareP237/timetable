import 'package:cloud_firestore/cloud_firestore.dart';


class fire {
  
  Future<bool> getplanningday(String day) async {
    await FirebaseFirestore.instance
        .collection('time-day').doc(day)
        .get();
        return true;
  }
  
}

// Future<bool> getCurrentUserInfos() async {
//   emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//   currentUserId = FirebaseAuth.instance.currentUser!.uid;
//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(currentUserId!)
//       .get()
//       .then((DocumentSnapshot documentSnapshot) async {
//     if (documentSnapshot.exists) {
//       await user.User.fromDocumentSnapshot(documentSnapshot).then((value) => {
//             currentUser = value,
//             currentFirstName = currentUser!.firstName,
//             currentLastName = currentUser!.lastName,
//             currentPhoneNumber = currentUser!.phoneNumber,

//         agencyLocation = ( currentUser!.location != null) ?  currentUser!.location : '',

//         agencyCity = (currentUser!.city != null) ? currentUser!.city : '',

//       print('city: $agencyCity Location: $agencyLocation'),
//       currentUserProfile = (currentUser!.profileUrl != null) ? currentUser!.profileUrl : '',

//           });

//       // print(agencyLocation);
//       // print(currentUser!.toMap());
//       // print('city: $currentFirstName Location: $currentLastName');

//       // await getMasterRoutes();
//       // print("City : " + departureLocation);
//       // await getTripOrderBuyDateTimeNow();
//     } else {
//       if (kDebugMode) {
//         print('Document does not exist on the database');
//       }
//       currentFirstName = "John";
//       currentLastName = "Five";
//     }
//   });
//   if (currentFirstName == null) {
//     return false;
//   } else {
//     return true;
//   }
// }