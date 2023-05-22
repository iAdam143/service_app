import 'package:flutter/material.dart';
import 'package:service_app/view/SplashScreen.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        //'/category': (context) => CategoryScreen(),
        //'/fruits': (context) => FruitsScreen(),
        //'/vegetables': (context) => VegetablesScreen(),
        //'/dairy': (context) => DairyScreen(),
        //'/meat': (context) => MeatScreen(),
      },
    );
  }
}
