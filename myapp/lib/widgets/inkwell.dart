import 'package:flutter/material.dart';


void main() {
 runApp(const MyApp());
}


class MyApp extends StatelessWidget {
 const MyApp({super.key});


 @override
 Widget build(BuildContext context) {
   return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: InkWellFixExample(),
   );
 }
}


class InkWellFixExample extends StatefulWidget {
 const InkWellFixExample({super.key});


 @override
 State<InkWellFixExample> createState() => _InkWellFixExampleState();
}


class _InkWellFixExampleState extends State<InkWellFixExample> {
 String message = "Tap Me";


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text("InkWell Fix")),
     body: Center(
       child: Material(
         color: Colors.orange, // ✅ Give color here
         borderRadius: BorderRadius.circular(12),
         child: InkWell(
           borderRadius: BorderRadius.circular(12),
           splashColor: Colors.white,
           highlightColor: Colors.black26,
           onTap: () {
             setState(() {
               message = "Tapped!";
             });
           },
           child: Padding(
             padding: const EdgeInsets.all(30),
             child: Text(
               message,
               style: const TextStyle(fontSize: 18, color: Colors.white),
             ),
           ),
         ),
       ),
     ),
   );
 }
}
