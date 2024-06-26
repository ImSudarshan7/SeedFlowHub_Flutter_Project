import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:seedflowhub/pages/about_page.dart';
import 'package:seedflowhub/pages/logout_page.dart';
import 'package:seedflowhub/pages/orders_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _feedbackController = TextEditingController();

    Future<void> _submitFeedback() async {
      try{
      await Firebase.initializeApp();
      FirebaseFirestore.instance.collection('feedback').add({
        'feedback': _feedbackController.text,
        'timestamp': DateTime.now(),
      });

      //Feedback Submitted successfully
      print('Feedback submitted successfully');
      //clear feedback feild after submits
      _feedbackController.clear();
      
        // Show a pop-up message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Feedback submitted successfully'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
    }catch (e) {
    print('Error submitting feedback: $e');
    // Handle error (e.g., show error message to user)
    }
    }


    return Scaffold(
      body: ListView(
        children: [
          // Existing profile content
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                  "https://scontent.fktm17-1.fna.fbcdn.net/v/t39.30808-6/379063879_1472622510262431_3386355963393981873_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_ohc=aJolriysWXkAX_WDMVr&_nc_ht=scontent.fktm17-1.fna&oh=00_AfBT5mUpYfImf0i20AhMDizKr-AMfsLjap23nVqlAzQAgg&oe=66073D6B",
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "Sudarshan Shrestha",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Center(
            child: Text(
              "shresthasudarshan777@gmail.com",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("My orders"),
            leading: const Icon(IconlyLight.bag),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrdersPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("About us"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(IconlyLight.logout),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogoutPage()),
              );
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feedback:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _feedbackController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitFeedback,
                  child: Text('Submit Feedback'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
