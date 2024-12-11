import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/counter_screen_controller.dart';
import 'package:getx_demo/views/add_todos.dart';
import 'package:getx_demo/views/counter_screen.dart';
import 'package:getx_demo/views/home_screen.dart';
import 'package:getx_demo/views/loclization_demo.dart';
import 'package:getx_demo/views/payment_screen.dart';

class RouteManager {
  static const initialRoute = Routes.localizationDemoScreen;

  static List<GetPage> getPages(){
    return [
      GetPage(name: Routes.homeScreen, page: () => const HomeScreen(),),
      GetPage(name: Routes.addTodoScreen, page: () => const AddTodosScreen(),),
      GetPage(name: Routes.counterAppScreen, page: () => CounterScreen(),),
      GetPage(name: Routes.localizationDemoScreen, page: () => LoclizationDemo(),),
      GetPage(name: Routes.paymentScreen, page: () => PaymentScreen())
    ];
  }
}
class Routes{
    static const homeScreen = '/homeScreen';
    static const addTodoScreen = '/addTodoScreen';
    static const counterAppScreen = '/counterAppScreen';
    static const localizationDemoScreen = '/localizationDemoScreen';
    static const paymentScreen = '/paymentScreen';
}