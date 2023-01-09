// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_booking_mobile_app/models/booking-model.dart';
// import 'package:e_booking_mobile_app/ressources/const.dart';
// import 'package:e_booking_mobile_app/screens/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:e_booking_mobile_app/models/user_model.dart' as user;

// class DBServices {
//   final CollectionReference booksCol =
//       FirebaseFirestore.instance.collection("bookings-$tenantName");

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
        //Upload to Firebase
//         var snapshot = await storage.ref('Profiles/'+image.name)
//         .putFile(File(image.path));
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         FirebaseFirestore.instance.collection('users-$tenantName').doc(currentUserId).update({'profileUrl':downloadUrl}).catchError((e)=>{
//           print('error has occured')
//         });
//         currentUserProfile = downloadUrl;
//         return true;
//       } else {
//         print('No Image Path Received');
//       }
//       return false;
//     } 

    
// }
