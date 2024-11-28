import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:retrofit_basic_exp/Home/GetApi.dart';

void main() {
  runApp(const MyApp());
}

// Initialize Logger
final logger = Logger();

class MyApp extends StatelessWidget {
static final logger = Logger();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}
