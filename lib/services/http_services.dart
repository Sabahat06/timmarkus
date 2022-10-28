// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class HttpServices {
//
//   static Future<AuthModel?> userLogin({String? email, String? password}) async {
//     try {
//       String url = AppApis.BASE_URL+AppApis.LOGIN_USER;
//       var response = await http.post(
//         Uri.parse(url),
//         body: {
//           'email': email,
//           'password': password
//         },
//       );
//       if (response.statusCode == 200) {
//         return AuthModel.fromJson(jsonDecode(response.body));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }
// }
//
//
//
