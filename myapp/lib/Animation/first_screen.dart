// lib/Animation/first_screen.dart

import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SecondScreen(),
              ),
            );
          },
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}