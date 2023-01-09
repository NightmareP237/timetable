// import 'dart:convert';
// import 'dart:io';
// import 'package:appadmin/Models/CustomerModel.dart';
// import 'package:appadmin/Models/api-response.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class APIService {
//   //----------------------------------------CUSTOMERS SERVICE API------------------------------
//   static Future<APIResponse> CreateCustomer(
//       {required Customer customer}) async {
//     return http
//         .post(Uri.parse(Url.urlPostTenant),
//             headers: await headersGenerator(),
//             body: jsonEncode(customer.toJson()))
//         .then((data) {
//       print(customer.toJson());
//       print(data.headers);
//       print(data.body);
//       if (data.statusCode == 201) {
//         return APIResponse(error: false);
//       }
//       return APIResponse(error: true, errorMessage: data.body);
//     }).catchError(
//             (_) => APIResponse(error: true, errorMessage: 'An error occurred'));
//   }

//   static getCustomers() async {
//     try {
//       // ignore: non_constant_identifier_names
//       final Response = await http.get(Uri.parse(Url.urlGetTenants), headers: {
//         'Content-Type': 'application/json',
//         'business-process-id': '',
//         'tenant-name': '',
//         "tenant-domain": "numcloud.cm",
//         "Authorization": "Bearer "
//       });

//       if (Response.statusCode == 200) {
//         var data = jsonDecode(Response.body);
//         return data;
//       } else if(Response.statusCode==409) {
//         return APIResponse(error: true, errorMessage: Response.body);
//       }else{
//         return APIResponse(error: true, errorMessage: Response.body);
//       }
//     } catch (e) {
//       print(e);
//       print("Erreur de serveur");
//       APIResponse(error: true, errorMessage: 'An error occurred');
//     }
//   }
// }

// getUsers() async {
//   try {
//     // ignore: non_constant_identifier_names
//     final Response = await http.get(Uri.parse(Url.urlGetTenants), headers: {});
//     if (Response.statusCode == 200) {
//       var data = jsonDecode(Response.body);
//       return data;
//     } else {
//       return null;
//     }
//   } catch (e) {
//     print(e);
//     print("Erreur de serveur");
//   }
// }

// //----------------------Header-------------------------!SECTION

// Future<Map<String, String>> headersGenerator() async {
//   // String businessProcessId = Uuid().v1();
//   // print(tenantDomain);
//   // print(jwToken);
//   // print(FirebaseRemoteConfig.instance.getString("tenantId"));
//   // await FirebaseAuth.instance.currentUser!
//   //     .getIdToken(true)
//   //     .then((value) => {jwToken = value});
//   return {
//     'Content-Type': 'application/json',
//     'business-process-id': '',
//     'tenant-name': '',
//     "tenant-domain": "numcloud.cm",
//     "Authorization": "Bearer "
//   };
// }

// //------------------------------------------URL OF API_SERVICE------------------------
// class Url {
//   static String baseUrlUsersService =
//       'https://users-service-y6xf5undfq-tl.a.run.app';
//   static String urlPostTenant = "$baseUrlUsersService/api/v1/tenants";
//   static String urlGetTenants = "$baseUrlUsersService/api/v1/tenants";
// }
