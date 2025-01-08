import 'package:electricity_app_home/features/sign_up.dart';
import 'package:electricity_app_home/pages/Home_Page.dart';
import 'package:electricity_app_home/pages/calculations.dart';
import 'package:flutter/material.dart';

import 'features/login_with_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // initialRoute: '/signup', // You might want to adjust this based on your app's flow
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/login_with_state': (context) => const LoginWithStatePage(),
        // '/home': (context) => const HomePage(), // Added route for HomePage
        // '/calculations': (context) => const calculationPage(), // Added route for CalculationsPage
      },
      home: SignUpPage(), // Or set your desired initial screen here
    );
  }
}