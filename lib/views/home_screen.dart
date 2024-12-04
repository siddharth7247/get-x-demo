import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/home_screen_controller.dart';
import 'package:getx_demo/services/api_services.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  HomeScreen({super.key});
  final _apiService = Get.find<ApiServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<HomeScreenController>(
          id: 'main',
          init: HomeScreenController(),
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.todoList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(controller.todoList[index].title.toString()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
