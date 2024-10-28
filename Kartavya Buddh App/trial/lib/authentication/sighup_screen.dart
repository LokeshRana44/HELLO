import 'package:flutter/material.dart';
import 'package:trial/authentication/login.dart';
import 'package:trial/mainScreens/main_screen.dart';

class SignUpScreen extends StatefulWidget
{
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen>
{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            // SizedBox(height: 50),
            // Icon(Icons.lock, size: 100,),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("images/logo.png"),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black87, // Set the background color of the button
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),


            ),
            // const Text(
            //   "Register as organization",
            //   style: TextStyle(
            //     // fontSize: 10,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            TextButton(
              child: const Text(
                "Welcome back, Register as Organization!",
                style: TextStyle(color: Colors.black87),
              ),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
              },
            ),

            // TextField(
            //
            // ),





          ],
        ),
      ),
      ),
    );
  }
}
