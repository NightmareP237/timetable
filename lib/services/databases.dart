import 'package:flutter/material.dart';

class DBServices {
  // final CollectionReference booksCol =
  //     FirebaseFirestore.instance.collection("bookings");

//   bool addBookings(Booking booking) {
//     booksCol
//         .add(booking.toMap())
//         .then((value) => true)
//         .catchError((onError) => false);
//     return true;
//   }
//   static uploadImage(XFile image) async {
//     var storage = FirebaseStorage.instance;
//     if (image != null){
//         //Upload to Firebase
//         var snapshot = await storage.ref('Profiles/'+image.name)
//         .putFile(File(image.path));
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         FirebaseFirestore.instance.collection('users').doc(currentUserId).update({'profileUrl':downloadUrl}).catchError((e)=>{
//           print('error has occured')
//         });
//         currentUserProfile = downloadUrl;
//         return true;
//       } else {
//         print('No Image Path Received');
//       }
//       return false;
//     } 

//     getCurrentUserInfos() {
//   currentUserId = FirebaseAuth.instance.currentUser!.uid;
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(currentUserId)
//       .get()
//       .then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       currentUser = user.User.fromDocumentSnapshot(documentSnapshot);
//       currentFirstName = currentUser!.firstName;
//       currentLastName = currentUser!.lastName;
//       currentPhoneNumber = currentUser!.phoneNumber;
//       agencyLocation = currentUser!.location;
//       agencyCity = currentUser!.city;
//       var url = currentUser!.profileUrl;
//       currentUserProfile = (url != null) ? url : '';
//       print(agencyLocation);
//       print(agencyCity);
//     } else {
//       if (kDebugMode) {
//         print('Document does not exist on the database');
//       }
//       currentFirstName = "John";
//       currentLastName = "Five";
//     }
//   });
// }
}
