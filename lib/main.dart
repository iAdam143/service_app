import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/view/home_screen.dart';
import 'package:service_app/view/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      /*localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],*/
      locale: const Locale('en',''),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        //'/': (context) => HomeScreen(),
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
