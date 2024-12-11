import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/localization/app_localization.dart';
import 'package:getx_demo/route_manager.dart';
import 'package:getx_demo/utils/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: AppLocalization(),
      fallbackLocale: const Locale('en', 'US'),
      locale: const Locale('en', 'US'),
      supportedLocales: const[
        Locale('en', 'US'),
        Locale('ar', 'AE'),
        Locale('hi','IN')
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        primaryColor: Colors.blueAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
        useMaterial3: true,
      ),
      initialRoute: RouteManager.initialRoute,
      getPages: RouteManager.getPages(),
    );
  }
}
