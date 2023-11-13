
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app_mvvm/UI/screens/movie_details.dart';

import 'UI/screens/home_screen.dart';
import 'utils/connection_checker.dart';

void main() async{
  HttpClient().badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ConnectivityWrapper(child: HomeScreen()),
      routes: {
        MovieDetails.routeName:(context) => MovieDetails(),
      },
    );
  }
}


