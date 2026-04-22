import 'package:flutter/material.dart';
class InputField extends StatelessWidget{final TextEditingController controller;final String label;const InputField({super.key,required this.controller,required this.label});
Widget build(BuildContext c)=>TextField(controller:controller,keyboardType:TextInputType.number,decoration:InputDecoration(labelText:label,border:OutlineInputBorder()));}