import 'package:flutter/material.dart';
import 'layout.dart';

void main() {
  runApp(MaterialApp(
    home: AlighWithMeLayout(),
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 39, 39, 41)), //(255, 39, 40, 41)
    ),
  ));
}
/*
    
    */