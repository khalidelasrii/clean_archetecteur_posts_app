import 'package:clean_archetecteur_pasts_app/core/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Posts')),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text("Helo world"),
        ),
      ),
    );
  }
}
