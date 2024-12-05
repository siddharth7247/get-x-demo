import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_demo/models/todos_model.dart';

class ApiServices {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  
  static Future<List<TodosModel>?> getTodos()async{
    Response response = await GetConnect().get('$baseUrl/todos');
    if(response.statusCode == 200){
      log("Api responce : ${response.body}");
      //return List<TodosModel>.from(response.body.map((x) => TodosModel.fromJson(x)));
      return (response.body as List).map((json) => TodosModel.fromJson(json)).toList();
    }else{
      return null;
    }
  }

  static Future addTodos(String title,String desecription)async{
    FormData formData = FormData({
      'title': title,
      'description': desecription,
      'completed': 'false'
   });
   Response response = await GetConnect().post('$baseUrl/todos', formData);
   if(response.statusCode == 200 || response.statusCode == 201) {
      log("Api responce in service class ${response.body}");
     return response;
   }else{
     return null;
   }
 }

 static Future<Response?> deleteTodo(int id)async{
    Response response = await GetConnect().delete('$baseUrl/todos/$id');
    if(response.statusCode == 200 || response.statusCode == 201) {
      log("Delete API Status code : ${response.statusCode}");
     return response;
   }else{
     return null;
   }
 }
}