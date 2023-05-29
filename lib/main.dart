import 'package:flutter/material.dart';
import 'package:service_app/view/splash_screen.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        //'/category': (context) => CategoryScreen(),
        //'/fruits': (context) => FruitsScreen(),
        //'/vegetables': (context) => VegetablesScreen(),
        //'/dairy': (context) => DairyScreen(),
        //'/meat': (context) => MeatScreen(),
      },
    );
  }
}
