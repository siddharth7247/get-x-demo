import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_demo/models/todos_model.dart';
import 'package:getx_demo/services/api_services.dart';

class HomeScreenController extends GetxController {
  int count = 0;
  bool isLoding = false;
  var todoList = List<TodosModel>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    featchTodos();
  }
  void add() {
    count++;
    update(['main']);
    log("Conter value : $count");
  }

  void featchTodos() async {
   
      isLoding = true;
      var todos = await ApiServices.getTodos();
      if (todos != null) {
        todos = todoList;
      }
    
  }
}
