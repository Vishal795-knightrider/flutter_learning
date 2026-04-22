import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget{final IconData icon;final String title;final VoidCallback onTap;const CustomCard({super.key,required this.icon,required this.title,required this.onTap});
Widget build(BuildContext c)=>InkWell(onTap:onTap,child:Card(child:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[Icon(icon,size:40),Text(title)]))));}