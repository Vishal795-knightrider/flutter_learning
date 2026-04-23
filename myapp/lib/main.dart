import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/bmi_screen.dart';
import 'screens/info_screen.dart';
import 'screens/about_screen.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget{
 const MyApp({super.key});
 Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,routes:{
 '/':(_)=>const SplashScreen(),'/home':(_)=>const HomeScreen(),'/bmi':(_)=>const BmiScreen(),'/info':(_)=>const InfoScreen(),'/about':(_)=>const AboutScreen(),
 });
}

