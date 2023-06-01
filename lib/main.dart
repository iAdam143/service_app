import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/view/home_screen.dart';
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
    ScreenUtil.init(context, designSize: const Size(176.4, 383.04),minTextAdapt: true);
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        //'/': (context) => HomeScreen(),
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
