import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trial/authentication/login.dart';
import 'package:trial/mainScreens/navbar.dart';
import 'package:trial/menu_item/fingerprint.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../menu_item/face scan.dart';
import '../menu_item/gps_scan.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_tool;

import '../menu_item/notification.dart';


// const LatLng currentLocation = LatLng(30.8604515, 75.8633109);

class  MainScreen extends StatefulWidget
{

  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();

}


class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  late String _data;
  bool _showBottomSheet = true;

  late TabController tabController;
  int selectedIndex =0;

  get gap => null;
  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }


  @override
  void initState() {
    super.initState();
    // getLoc();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavBar(),
      appBar: AppBar(
        // title: const Text("Kartavya-Baddh"),
        // centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c)=> NotificationPage()));
            },
          ),
          IconButton(
           icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
          // IconButton(
          //  icon: const Icon(Icons.search),
          //   onPressed: () {},
          // ),

        ],
        backgroundColor: Colors.amber,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: IconButton(
        //     icon: const Icon(Icons.menu),
        //     onPressed: () {},
        //   ),
        // ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(),

        ),
      ),

    body: Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.start, // Aligns children at the top
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset("images/app text.png"),
        ),


        // Text(
        //   'KARTAVYA-BADDH',
        //   style: TextStyle(fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // Text(
        //   'Tracks the on time location of the ground personal',
        //   style: TextStyle(fontSize: 13),
        // ),
        // Text(
        //   'MARK YOUR ATTENDANCE',
        //   style: TextStyle(fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //   ),
        // ),
        // Row(
          // children: [
          //   Image.asset('images/fingerprint.png',
          //     width: 50,
          //     height: 50,
          //   ),
           Row(
            children: [
              GestureDetector(
                child: Image.asset('images/fingerprint.png',
                  width: 75,
                  height: 75,
                ),
                onTap: () {
                  // Navigate to the next page.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FingerprintAuth()),
                  );
                },
              ),
              GestureDetector(
                child: Image.asset('images/face_scan.png',
                  width: 75,
                  height: 75,
                ),
                onTap: () {
                  // Navigate to the next page.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              GestureDetector(
                child: Image.asset('images/GPS_scan.png',
                  width: 75,
                  height: 75,
                ),
                onTap: () {
                  // Navigate to the next page.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationPage()),
                  );
                },
              ),

              // Text('Tap to open bottom sheet'),
              // ElevatedButton(
              //   onPressed: _toggleBottomSheet,
              //   child: Text('Open'),
              // ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
           ),
        SizedBox(height: 5),
        // Positioned(
        //   height: 29,
        //   width: 50,
        //     child: GoogleMap(
        //       initialCameraPosition: const CameraPosition(
        //         target: currentLocation,
        //         zoom:14.4746,
        //       ),
        //
        //
        //   ),
        // ),
        Positioned(
          height: 290,
          width: 500,
          child: SizedBox(
            height: 290,
            width: 500,
            child: GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
              // circles: {
              //   Circle(
              //     circleId: CircleId("1"),
              //     center: LatLng(position.latitude, position.longitude),
              //     radius: 430,
              //     strokeWidth: 2,
              //     fillColor: Color(0xFF006491).withOpacity(0.2),
              //   ),
              // },
            ),)
        ),
      ],
     ),
    ),
      bottomSheet: _showBottomSheet
          ? BottomSheet(
          elevation: 0,
          backgroundColor: Colors.amber,
          enableDrag: true,
          onClosing: () {},
          builder: (BuildContext ctx) => Container(
            width: double.infinity,
            height: 295,
            alignment: Alignment.center,
            // child: ElevatedButton(
            //   child: const Text(
            //     'Close this bottom sheet',
            //   ),
            //   onPressed: () {},
            //
            // ),

            child: Center(child : Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0), child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                SizedBox(height: 20),
                CupertinoListTile(
                  title: Container(
                      color: Colors.white, // Set text background color to white
                      padding: EdgeInsets.all(4.0),
                      child: Text('Ansul',
                        style: TextStyle(fontSize: 14.0),

                      ),
                    ),
                  // Icon(CupertinoIcons.person),

                ),CupertinoListTile(
                  title: Container(
                      color: Colors.white, // Set text background color to white
                      padding: EdgeInsets.all(4.0),
                      child: Text('Next Attendance in: Pending',
                        style: TextStyle(fontSize: 14.0),

                      ),
                    ),
                  // Icon(CupertinoIcons.person),

                ),CupertinoListTile(
                  title: Container(
                      color: Colors.white, // Set text background color to white
                      padding: EdgeInsets.all(4.0),
                      child: Text('Assigned Location 1',
                        style: TextStyle(fontSize: 14.0),

                      ),
                    ),
                  // Icon(CupertinoIcons.person),

                ),CupertinoListTile(
                  title: Container(
                      color: Colors.white, // Set text background color to white
                      padding: EdgeInsets.all(4.0),
                      child: Text('Assigned Location 2',
                        style: TextStyle(fontSize: 14.0),

                      ),
                    ),
                  // Icon(CupertinoIcons.person),

                ),
                // CupertinoListTile(
                //   leading: Icon(CupertinoIcons.clock),
                //   title: Text('Next Attendance in: Pending'),
                // ),
                // CupertinoListTile(
                //   leading: Icon(CupertinoIcons.location),
                //   title: Text('Assigned Location 1'),
                //   onTap: () {
                //     // Do something when the tile is tapped.
                //   },
                // ),
                // CupertinoListTile(
                //   leading: Icon(CupertinoIcons.location),
                //   title: Text('Assigned Location 2'),
                //   onTap: () {
                //     // Do something when the tile is tapped.
                //   },
                // ),
                // TextField(
                //   controller: personnelTextEditingController,
                //   style: const TextStyle(
                //     color: Colors.black87,
                //   ),
                //   decoration: const InputDecoration(
                //     labelText: "Ansul Pal",
                //     // hintText: "Email",
                //     // prefixIcon: Icon(Icons.email),
                //     // border: OutlineInputBorder(
                //     //   borderSide: BorderSide(color: Colors.white),
                //     // ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //     fillColor: Colors.white,
                //     filled: true,
                //     hintStyle: TextStyle(
                //       color: Colors.black87,
                //       fontSize: 10,
                //     ),
                //     // labelStyle: TextStyle(
                //     //   color: Colors.black,
                //     //   fontSize: 14,
                //     // ),
                //
                //   ),
                // ),
                // // Text(_data),
                // SizedBox(height: 20),
              //   Container(
              //     color: Colors.white, // Set text background color to white
              //     padding: EdgeInsets.all(4.0),
              //     child: Text(
              //       'This is a custom bottom sheet',
              //       style: TextStyle(fontSize: 14.0),
              //     ),
              //   ),
              //   TextField(
              //     controller: personnelTextEditingController,
              //     style: const TextStyle(
              //       color: Colors.black87,
              //     ),
              //     decoration: const InputDecoration(
              //       labelText: "Ansul Pal",
              //       // hintText: "Email",
              //       // prefixIcon: Icon(Icons.email),
              //       // border: OutlineInputBorder(
              //       //   borderSide: BorderSide(color: Colors.white),
              //       // ),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white),
              //       ),
              //       fillColor: Colors.white,
              //       filled: true,
              //       hintStyle: TextStyle(
              //         color: Colors.black87,
              //         fontSize: 10,
              //       ),
              //       // labelStyle: TextStyle(
              //       //   color: Colors.black,
              //       //   fontSize: 14,
              //       // ),
              //
              //     ),
              //   ),
              //   // SizedBox(height: 16.0),
              //   // TextFormField(
              //   //   style: TextStyle(color: Colors.white), // Set text color to white
              //   //   decoration: InputDecoration(
              //   //     labelText: 'Enter your name',
              //   //     labelStyle: TextStyle(color: Colors.white),
              //   //     enabledBorder: UnderlineInputBorder(
              //   //       borderSide: BorderSide(color: Colors.white),
              //   //     ),
              //   //     focusedBorder: UnderlineInputBorder(
              //   //       borderSide: BorderSide(color: Colors.white),
              //   //     ),
              //   //   ),
              //   // ),
              //   ListTile(
              //     leading:
              //     IconButton(
              //       icon: const Icon(Icons.account_circle, size: 50),
              //       onPressed: () {
              //         Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) => LoginScreen()),
              //               );
              //       },
              //     ),
              //     // Icon(Icons.account_circle,
              //     //   size: 50,
              //     // ),
              //     // title: Text('Profile'),
              //     // onTap: () {
              //     //   // Navigate to the next page.
              //     //   Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(builder: (context) => LoginScreen()),
              //     //   );
              //     // },
              //   ),
              ],
            ),),),
          ))
          : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


          markers.clear();

          markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

          setState(() {});

        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_searching),
      ),
    );
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
