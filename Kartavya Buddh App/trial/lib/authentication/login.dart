import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial/authentication/sighup_screen.dart';
import 'package:trial/mainScreens/main_screen.dart';

import '../Model/config.dart';
import '../Model/fetchData.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget
{

  @override
  _LoginScreenState createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  //
  //
  // void loginval() async{
  //   if(emailTextEditingController.text.isNotEmpty && passwordTextEditingController.text.isNotEmpty){
  //
  //   }else{
  //     setState(() {
  //       _isNotValidate = true;
  //     });
  //   }
  // }

  late SharedPreferences prefs;
  @override
  void initState(){
    // TODO: implement initstate
    super.initState();
    initSharedPref();
  }
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
  void registerUser() async{
    if(emailTextEditingController.text.isNotEmpty && passwordTextEditingController.text.isNotEmpty){
      var regBody = {
        "email":emailTextEditingController.text,
        "password":passwordTextEditingController.text
      };
      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(regBody)
      );
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['token']);


       response = await http.get(Uri.parse(me),
          headers: {"Content-Type":"application/json", "Authorization": "Bearer "+ jsonResponse['token']}
      );
       var jsonResponse2 = jsonDecode(response.body);
      print(jsonResponse2['status']);
      if(jsonResponse['status']){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
      }else{
        print("SomeThing Went Wrong");
        Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
      }
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      setState(() {
        // _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber,
      body: Form(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              // SizedBox(height: 50),
              // Icon(Icons.lock, size: 100,),



                // const SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("images/logo.png"),
                ),

                // const SizedBox(height: 10,),

                const Text(
                  "Login With Your Credentials",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,),

                TextField(
                  controller: emailTextEditingController,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: const InputDecoration(
                    // labelText: "Email",
                    // errorStyle: TextStyle(color: Colors.white),
                    // errorText: _isNotValidate ? "Password Wrong" : null,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 10,
                    ),
                    // labelStyle: TextStyle(
                    //   color: Colors.black,
                    //   fontSize: 14,
                    // ),

                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: passwordTextEditingController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: const InputDecoration(
                    // labelText: "Password",
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    // errorStyle: TextStyle(color: Colors.white),
                    // errorText: _isNotValidate ? "Password Wrong" : null,
                    // border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,

                    hintStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 10,
                    ),
                    // labelStyle: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 14,
                    // ),

                  ),


                ),


                Row(
                  children: [
                    TextButton(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
                      },
                    ),
                  ],
                ),

                ElevatedButton(

                  onPressed: ()
                  {
                    // loginval();
                    registerUser();
                    // validateForm();
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MainScreen()));
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

                // TextButton(
                //   child: const Text(
                //     "Forgot Password?",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onPressed: ()
                //   {
                //     Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
                //   },
                // ),
              ]
          ),
        ),
      ),
      ),
    );
  }
}


