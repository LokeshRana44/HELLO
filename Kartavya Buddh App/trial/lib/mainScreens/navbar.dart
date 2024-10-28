import 'package:flutter/material.dart';
import 'package:trial/authentication/login.dart';
import 'package:trial/menu_item/setting.dart';

import '../menu_item/attendace_history.dart';
import '../menu_item/attendance_missed.dart';
import '../menu_item/logout.dart';
import '../menu_item/notification.dart';
import '../menu_item/profile_tab.dart';
import '../menu_item/upcoming_event.dart';
// import '../menu_item/setting.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Ansul"),
            accountEmail: Text("ansul@pal"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://example.com/user_profile_image.jpg',
                  width: 213,
                  height: 452424,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Fsearch%3Fq%3Dbackground&psig=AOvVaw0w6Gtn5iiQwuSBzDzD0k13&ust=1690714480441000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKCSobjgs4ADFQAAAAAdAAAAABAE',
                ),
                fit: BoxFit.cover,
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.perm_identity_rounded),
            title: Text('Profile'),
            onTap: () {
              // Navigate to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history_edu),
            title: Text('Attendance History'),
            onTap: () {
              // Navigate to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.upcoming),
            title: Text('Upcoming Event'),
            onTap: () {
              // Navigate to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => upEvents()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.web_asset_off_rounded),
            title: Text('Attendance Missed'),
            onTap: () {
              // Navigate to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceMissedPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.sim_card_download_outlined),
            title: Text('Download Attendance Report'),
            // onTap: () {
            //   // Navigate to the next page.
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => FingerprintApp()),
            //   );
            // },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              // Navigate to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Navigate to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
