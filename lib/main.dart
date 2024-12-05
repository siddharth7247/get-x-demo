import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        primaryColor: Colors.blueAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent
        ),
        useMaterial3: true,
      ),
      initialRoute: RouteManager.initialRoute,
      getPages: RouteManager.getPages(),
    );
  }
}

