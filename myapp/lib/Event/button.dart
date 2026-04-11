import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EventExample(),
    );
  }
}

class EventExample extends StatefulWidget {
  const EventExample({super.key});

  @override
  State<EventExample> createState() => _EventExampleState();
}

class _EventExampleState extends State<EventExample> {
  String message = "No action yet";

  void handleClick() {
    setState(() {
      message = "Button Clicked!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event Handling")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleClick, // EVENT
              child: const Text("Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}

