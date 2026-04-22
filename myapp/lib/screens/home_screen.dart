import 'package:flutter/material.dart';import '../widgets/custom_card.dart';
class HomeScreen extends StatelessWidget{const HomeScreen({super.key});
Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Home')),body:Padding(padding:const EdgeInsets.all(12),child:GridView.count(crossAxisCount:2,children:[
CustomCard(icon:Icons.calculate,title:'Calculate',onTap:()=>Navigator.pushNamed(c,'/bmi')),
CustomCard(icon:Icons.info,title:'BMI Info',onTap:()=>Navigator.pushNamed(c,'/info')),
CustomCard(icon:Icons.favorite,title:'Health Tips',onTap:()=>Navigator.pushNamed(c,'/info')),
CustomCard(icon:Icons.person,title:'About',onTap:()=>Navigator.pushNamed(c,'/about')),
])));}