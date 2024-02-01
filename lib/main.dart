import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/onboarding/onboarding.dart';
import 'package:light_height_ecomerce_app/presentation/views/app.dart';
import 'package:light_height_ecomerce_app/presentation/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Light and Height Task',
      theme: ThemeData(
        

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        
      ),
      initialRoute: "/",
      routes: {
        "/":(context)=> Onboarding(),
        "/app":(context)=> App(),
        "/login":(context)=> Login(),
      },
     
    );
  }
}

