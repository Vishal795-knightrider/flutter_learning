import 'package:flutter/material.dart';
class InfoScreen extends StatelessWidget{const InfoScreen({super.key});
Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('BMI Info')),body:ListView(children:const[
ListTile(title:Text('Underweight <18.5')),ListTile(title:Text('Normal 18.5-24.9')),ListTile(title:Text('Overweight 25-29.9')),ListTile(title:Text('Obese 30+'))
]));}