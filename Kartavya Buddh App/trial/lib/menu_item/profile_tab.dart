// import 'package:flutter/material.dart';
//
// class ProfileUI extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Column(
//       children: <Widget>[
//         Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             // Image(image: NetworkImage()),
//             Image.asset("images/logo.png"),
//             Positioned(child: CircleAvatar(radius: 80,backgroundColor: Colors.white,0
//           ]
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://example.com/user_profile_image.jpg',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ansul Pal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Constable in Believers Thana',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile button press
              },
              child: Text('Edit Profile'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Handle logout button press
            //   },
            //   child: Text('Logout'),
            // ),
          ],
        ),
      ),
    );
  }
}
