import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String title = "First Title";

  void changeTitle() {
    setState(() {
      title = "Title Changed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),

        body: Center(
          child: ElevatedButton(
            onPressed: changeTitle,
            child: Text("Change Title"),
          ),
        ),

      ),
    );
  }
}