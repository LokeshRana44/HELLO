import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
class Dashboard extends StatefulWidget {
  final token;

  const Dashboard({@required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard>
{
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken['email'];
  }
  @override
    Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,

      ),
    );
  }
}