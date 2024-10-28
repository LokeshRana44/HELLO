import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trial/authentication/sighup_screen.dart';
// import 'package:trial/tabPages/profile_tab.dart';

import '../authentication/login.dart';
import '../mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{
  startTimer()
  {
    Timer(const Duration(seconds: 4), () async
    {
      //send user to main screen
      Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
    }); // Timer
  }
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    debugShowCheckedModeBanner: ;

    return Material(
      child: Container(
        color: Colors.amber,
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               Image.asset("images/applogo.png",
                 width: 200,
                 height: 200,
               ),

               const SizedBox(height: 10,),
             ],
           ),
         ),
      ),
    );
  }
}
