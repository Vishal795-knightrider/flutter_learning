import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget{final String text;final VoidCallback onTap;const CustomButton({super.key,required this.text,required this.onTap});
Widget build(BuildContext c)=>SizedBox(width:double.infinity,child:ElevatedButton(onPressed:onTap,child:Text(text)));}