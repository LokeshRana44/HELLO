// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// // import 'package:local_auth/auth_strings.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_ios/local_auth_ios.dart';
// import 'package:local_auth/local_auth.dart';
//
// class LocalAuthApi {
//   static final _auth = LocalAuthAndroid();
//
//   static Future<bool> hasBiometrics() async {
//     try {
//       return await _auth.isDeviceSupported();
//     } on PlatformException catch (e) {
//       return false;
//     }
//   }
//
//   static Future<bool> authenticate() async {
//     final isAvailable = await hasBiometrics();
//     if (!isAvailable) return false;
//
//     try {
//       return await _auth.authenticate(
//         authMessages:  const <AuthMessages>[
//           AndroidAuthMessages(
//             signInTitle: 'Oops! Biometric authentication required!',
//             cancelButton: 'No thanks',
//           ),
//           IOSAuthMessages(
//             cancelButton: 'No thanks',
//           ),
//         ],
//        options: AuthenticationOptions(   useErrorDialogs: false,
//          stickyAuth: false,),
//         localizedReason: 'Scan Face to Authenticate',
//
//       );
//     } on PlatformException catch (e) {
//       return false;
//     }
//   }
// }