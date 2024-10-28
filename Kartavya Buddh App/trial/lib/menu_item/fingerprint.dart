// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
//
//
// void main() => runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: FingerprintApp(),
// ));
//
// class FingerprintApp extends StatefulWidget {
//   @override
//   _FingerprintAppState createState() => _FingerprintAppState();
// }
//
// class _FingerprintAppState extends State<FingerprintApp> {
//
//   LocalAuthentication auth = LocalAuthentication();
//   late bool _canCheckBiometric;
//   late List<BiometricType> _availableBiometrics;
//   String autherized = "Not autherized";
//
//   Future<void> _checkBiometric() async {
//     bool canCheckBiometric;
//     try {
//       canCheckBiometric = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     if (!mounted) return;
//     setState(() {
//       _canCheckBiometric = canCheckBiometric;
//     });
//   }
//
//   Future<void> _getAvailableBiometric() async{
//     List<BiometricType> availableBiometric;
//     try{
//       availableBiometric = await auth.getAvailableBiometrics();
//     } on PlatformException catch(e){
//       print(e);
//     }
//     setState(() {
//       _availableBiometrics = availableBiometric;
//     });
//   }
//
//   Future<void> _authenticate() async{
//     bool authenticated = false;
//
//     try{
//       authenticated = await auth.authenticate(
//         localizedReason: "Scan your finger to authenticate",
//           usesErrorDialogs: true,
//           stickyAuth: false
//       );
//     } on PlatformException catch(e){
//       print(e);
//     }
//     if(!mounted) return;
//     setState(() {
//       autherized = authenticated ? "Autherized success" : "Failed to authenticate";
//       print(autherized);
//
//     });
//   }
//   @override
//   void initstate() {
//     _checkBiometric();
//     _getAvailableBiometric();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold());
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//






















// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/error_codes.dart' as error_code;
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_ios/local_auth_ios.dart';
//
// void main() {
//   runApp(const FingerprintApp());
// }
//
// class FingerprintApp extends StatelessWidget {
//   const FingerprintApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   bool isDeviceSupport = false;
//   List<BiometricType>? availableBiometrics;
//   LocalAuthentication? auth;
//
//   @override
//   void initState() {
//     super.initState();
//     auth = LocalAuthentication();
//     deviceCapability();
//     _getAvailableBiometrics();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
//
//   Future<void> _getAvailableBiometrics() async {
//     try {
//       availableBiometrics = await auth?.getAvailableBiometrics();
//       print("bioMetric: $availableBiometrics");
//
//       if (availableBiometrics!.contains(BiometricType.strong) ||
//           availableBiometrics!.contains(BiometricType.fingerprint)) {
//         await _authenticateWithFingerprint();
//       } else if (availableBiometrics!.contains(BiometricType.weak) ||
//           availableBiometrics!.contains(BiometricType.face)) {
//         await _authenticateWithFace();
//       }
//     } on PlatformException catch (e) {
//       if (e.code == error_code.passcodeNotSet) {
//         exit(0);
//       }
//       print("error: $e");
//     }
//   }
//
//   Future<void> _authenticateWithFingerprint() async {
//     final bool didAuthenticate = await auth!.authenticate(
//       localizedReason:
//       'Unlock your screen with PIN, pattern, password, face, or fingerprint',
//       options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
//       authMessages: const <AuthMessages>[
//         AndroidAuthMessages(
//           signInTitle: 'Unlock Ideal Group',
//           cancelButton: 'No thanks',
//         ),
//         IOSAuthMessages(
//           cancelButton: 'No thanks',
//         ),
//       ],
//     );
//     if (!didAuthenticate) {
//       exit(0);
//     }
//   }
//
//   Future<void> _authenticateWithFace() async {
//     final bool didAuthenticate = await auth!.authenticate(
//       localizedReason:
//       'Unlock your screen with PIN, pattern, password, face, or fingerprint',
//       options: const AuthenticationOptions(stickyAuth: true),
//       authMessages: const <AuthMessages>[
//         AndroidAuthMessages(
//           signInTitle: 'Unlock Ideal Group',
//           cancelButton: 'No thanks',
//         ),
//         IOSAuthMessages(
//           cancelButton: 'No thanks',
//         ),
//       ],
//     );
//     if (!didAuthenticate) {
//       exit(0);
//     }
//   }
//
//   void deviceCapability() async {
//     final bool isCapable = await auth!.canCheckBiometrics;
//     isDeviceSupport = isCapable || await auth!.isDeviceSupported();
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_ios/local_auth_ios.dart';
//
// void main() {
//   runApp(const FingerprintApp());
// }
//
// class FingerprintApp extends StatelessWidget {
//   const FingerprintApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool _isAuthenticated = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkFingerprintScan();
//   }
//
//   void _checkFingerprintScan() async {
//     bool isFingerprintScanAvailable = await LocalAuthentication().canCheckBiometrics;
//
//     if (isFingerprintScanAvailable) {
//       final bool didAuthenticate = await LocalAuthentication().authenticate(
//           localizedReason: 'Unlock your screen with your fingerprint',
//           options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
//           authMessages: const <AuthMessages>[
//             AndroidAuthMessages(
//               signInTitle: 'Unlock Ideal Group',
//               cancelButton: 'No thanks',
//             ),
//             IOSAuthMessages(
//               cancelButton: 'No thanks',
//             ),
//           ]);
//
//       setState(() {
//         _isAuthenticated = didAuthenticate;
//       });
//     } else {
//       setState(() {
//         _isAuthenticated = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Finger print'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Image.asset('assets/gps.png', width: 100),
//             Text('Finger Print', style: TextStyle(
//                 fontSize: 48.0,
//                 fontWeight: FontWeight.bold
//             ),
//             ),
//             Text(_isAuthenticated ? 'Authenticated' : 'Not authenticated'),
//             ElevatedButton(
//               onPressed: _checkFingerprintScan,
//               child: Text(_isAuthenticated ? 'Re-authenticate' : 'Authenticate'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   final LocalAuthentication _localAuth = LocalAuthentication();
//   final FirebaseVision _vision = FirebaseVision.instance;
//
//   void _authenticate() async {
//     try {
//       bool isFingerprintSupported = await _localAuth.canCheckBiometrics;
//       if (isFingerprintSupported) {
//         bool isFingerprintAuthorized = await _localAuth.authenticate(
//           localizedReason: 'Authenticate with fingerprint',
//           useErrorDialogs: true,
//           stickyAuth: true,
//         );
//
//         if (isFingerprintAuthorized) {
//           // Fingerprint authenticated, now perform face scan
//           await _performFaceScan();
//         }
//       } else {
//         // Fingerprint not supported, handle this case
//       }
//     } catch (e) {
//       // Handle authentication errors
//     }
//   }
//
//   Future<void> _performFaceScan() async {
//     try {
//       final imagePicker = ImagePicker();
//       final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
//
//       if (pickedFile != null) {
//         final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(File(pickedFile.path));
//         final FaceDetector faceDetector = _vision.faceDetector();
//
//         List<Face> faces = await faceDetector.processImage(visionImage);
//
//         if (faces.isNotEmpty) {
//           // Face detected, proceed with user validation
//           // Implement your validation logic here
//         } else {
//           // No face detected, handle this case
//         }
//       } else {
//         // Handle image capture cancellation or failure
//       }
//     } catch (e) {
//       // Handle face scan errors
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Fingerprint & Face Scan')),
//       body: Center(
//         child: GestureDetector(
//           onTap: _authenticate, // Trigger authentication on tap
//           child: Image.asset('assets/fingerprint_scan.png'), // Replace with your fingerprint scan image
//         ),
//       ),
//     );
//   }
// }




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class FingerprintAuth extends StatefulWidget {
  const FingerprintAuth({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final auth = LocalAuthAndroid();
  String authorized = " not authorized";
  bool _canCheckBiometric = false;
  late List<BiometricType> _availableBiometric;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        authMessages:  const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        options:AuthenticationOptions(stickyAuth: true, useErrorDialogs: true) ,
          localizedReason: "Scan your finger to authenticate",);
          // useErrorDialogs: true,
          // stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      authorized =
      authenticated ? "Authorized success" : "Failed to authenticate";
      print(authorized);
    });
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;

    try {
      canCheckBiometric = await auth.isDeviceSupported();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];

    try {
      availableBiometric = await auth.getEnrolledBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Scan Your Fingerrint ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child: const Text(
                      "Authenticate using your fingerprint instead of your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    width: double.infinity,
                    child: FloatingActionButton(
                      onPressed: _authenticate,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 14.0),
                        child: Text(
                          "Authenticate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



