import 'dart:convert';

List<TodosModel> todosModelFromJson(String str) => List<TodosModel>.from(json.decode(str).map((x) => TodosModel.fromJson(x)));

String todosModelToJson(List<TodosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosModel {
    final int userId;
    final int id;
    final String title;
    final bool completed;

    TodosModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
