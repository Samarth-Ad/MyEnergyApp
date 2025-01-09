import 'package:energy_monitoring_app/Theme/theme_provider.dart';
import 'package:energy_monitoring_app/pages/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    child: const MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
      );
  }
}