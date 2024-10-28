import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trial/authentication/sighup_screen.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final response = await http.post(
      Uri.parse('https://vast-boa-buckle.cyclic.app/api/v1/logout'),
      headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZDIyMjUyMzVmNmEzNDljODQzMDNiYiIsImlhdCI6MTY5MTU0MzYzMiwiZXhwIjoxNjkyODM5NjMyfQ.ItfpCNq6STm5WNcudvPsVnza95n7OK5iujpgTOLo7Io'}, // Replace with your access token
    );

    if (response.statusCode == 200) {
      // Logout successful, navigate to login page or any other page as needed
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),); // Close the logout page
      // You can navigate to the login page or any other desired page here
    } else {
      // Handle logout error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logout failed. Please try again.'),
        ),
      );
    }
  }
}
