import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/todos_model.dart';
import 'package:getx_demo/services/api_services.dart';

class HomeScreenController extends GetxController {
  bool isLoding = false;
  List<TodosModel> todoList = [];

  @override
  void onInit() {
    super.onInit();
    featchTodos();
  }

  void updateList(){
     update(['main']);
  }

  void featchTodos() async {
    try {
      isLoding = true;
      todoList = (await ApiServices.getTodos())!;
      isLoding = false;
      update(['main']);
    } catch (e) {
      log("Exception on api call : $e");
    } finally {
      isLoding = false;
    }
  }

  Future<void> addTodo(String title, String desecription) async {
    try {
      isLoding = true;
      Response responce = await ApiServices.addTodos(title, desecription);
      if (responce.statusCode == 201 || responce.statusCode == 200) {
        isLoding = false;
        update(['main']);
        Get.snackbar("Success", "New Task Added Sccesfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade300);
      }
    } catch (e) {
      isLoding = false;
      update(['main']);
      Get.snackbar("Failure", "UnExpected Error Occured",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade300);
    } finally {
      isLoding = false;
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      isLoding = true;
      Response? response = await ApiServices.deleteTodo(id);
      if (response?.statusCode == 201 || response?.statusCode == 200) {
        isLoding = false;
        update(['main']);
        Get.snackbar("Success", "Task Deleted Sccesfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade300);
      }
    } catch (e) {
      isLoding = false;
      update(['main']);
      Get.snackbar("Failure", "UnExpected Error Occured",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade300);
    } finally {
      isLoding = false;
    }
  }
}
