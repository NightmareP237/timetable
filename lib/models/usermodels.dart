class Users {
  // String input;
  // String? uid;
  String firstName;
  String lastName;
  String matricule;
  String password;
  String salle;
  String userid;
  String filiere;
  Users(
      {
      // required this.input,
      // this.uid,
      required this.filiere,
      required this.firstName,
      required this.lastName,
      required this.matricule,
      required this.password,
      required this.salle,
      required this.userid});
  factory Users.fromJson(Map<String, dynamic> data) => Users(
        // input: data['input'],
        userid: data['userid'],
        firstName: data['firstName'],
        lastName: data['lastName'],
        salle: data['salle'],
        matricule: data['matricule'],
        password: data['password'],
        filiere: data['filiere'],
      );

  Map<String, dynamic> toMap() => {
        "userid": userid,
        "firstName": firstName,
        "lastName": lastName,
        "salle": salle,
        "matricule": matricule,
        "password": password,
        "filiere": filiere
      };
  // static Future<User> fromDocumentSnapshot(DocumentSnapshot documentSnapshot) async {
  //   // getTenantInfos(documentSnapshot);

  //   final Map<String, dynamic> data =
  //       documentSnapshot.data() as Map<String, dynamic>;
  //   tenantId = data['tenantId'];
  //   await FirebaseFirestore.instance
  //       .collection('tenants')
  //       .doc(tenantId)
  //       .get()
  //       .then((value) async {
  //     Map<String, dynamic> da = value.data() as Map<String, dynamic>;
  //     tenantName = da['tenantName'];
  //     print('Getted : ' + tenantName + tenantId);
  //      await getMasterRoutes(tenantName);
  //   });

  //   return User(
  //       uid: documentSnapshot.id,
  //       firstName: data['firstName'],
  //       lastName: data['lastName'],
  //       phoneNumber: data['phoneNumber'],
  //       roles: data['roles'],
  //       city: data['city'],
  //       location: data['location'],
  //       profileUrl: data['profileUrl']);
  // }

  // static getTenantInfos(DocumentSnapshot documentSnapshot) {
  //   Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
  //   tenantId = data['tenantId'];
  //   FirebaseFirestore.instance
  //       .collection('tenants')
  //       .doc(tenantId)
  //       .get()
  //       .then((value) {
  //     Map<String, dynamic> da = value.data() as Map<String, dynamic>;
  //     tenantName = da['tenantName'];
  //     print('Getted : ' + tenantName + tenantId);
  //   });
  // }

  // Map<String, dynamic> toJson() => {
  //       "uid": uid,
  //       "firstName": firstName,
  //       "lastName": lastName,
  //       "phoneNumber": phoneNumber,
  //       "roles": roles,
  //       "city": city,
  //       "location": location,
  //       "profileUrl": profileUrl
  //     };
}

class planning {
  String? plan;
  int? students;

  planning({
    required this.plan,
    required this.students
  });
  factory planning.fromJson(Map<String, dynamic> data) => planning(
        plan: data['planing-date'],
        students: data['students'],
      );
}
