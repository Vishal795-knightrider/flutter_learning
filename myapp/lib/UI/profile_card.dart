// lib/UI/profile_card.dart

import 'package:flutter/material.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Abhishek Kumar",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Flutter Developer",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 220,
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: const Text(
                  "+91 9876543210",
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: const Text(
                  "abhishek@gmail.com",
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.teal,
                ),
                title: const Text(
                  "Ghaziabad, India",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}