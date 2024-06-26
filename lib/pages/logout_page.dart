import 'package:flutter/material.dart';
import 'package:seedflowhub/pages/login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Perform logout actions when the LogoutPage is built
    _logout(context);

    // Return a placeholder widget while performing logout
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: const Center(
        child: CircularProgressIndicator(), // Placeholder widget
      ),
    );
  }

  void _logout(BuildContext context) {
    // Perform logout actions here, such as clearing session data or resetting state.

    // Navigate back to the LoginPage
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
}
