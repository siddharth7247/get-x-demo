import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_demo/models/todos_model.dart';

class ApiServices {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  static Future<List<TodosModel>?> getTodos()async{
    Response response = await GetConnect().get(baseUrl);
    if(response.statusCode == 200){
      log("Api responce : ${response.body}");
      //log("Api after parse : ${todosModelFromJson(response.body).toString()}");
      return List<TodosModel>.from(response.body.map((x) => TodosModel.fromJson(x)));
    }else{
      return null;
    }
  }
}