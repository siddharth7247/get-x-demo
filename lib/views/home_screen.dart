import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/home_screen_controller.dart';
import 'package:getx_demo/models/todos_model.dart';
import 'package:getx_demo/route_manager.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({super.key});
  // final _apiService = Get.find<ApiServices>();
  @override
  Widget build(BuildContext context) {
    log("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks To Do"),
      ),
      body: Center(
        child: GetBuilder<HomeScreenController>(
          id: 'main',
          init: HomeScreenController(),
          builder: (controller) {
            return controller.isLoding
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: controller.todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            controller.todoList[index].title.toString(),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    controller.todoList[index].completed
                                        ? Colors.green.shade100
                                        : Colors.grey.shade300,
                                child: IconButton(
                                  onPressed: () {
                                    TodosModel t1 = TodosModel(
                                        userId:
                                            controller.todoList[index].userId,
                                        id: controller.todoList[index].id,
                                        title: controller.todoList[index].title,
                                        completed: !controller
                                            .todoList[index].completed);
                                    controller.todoList
                                        .replaceRange(index, index + 1, [t1]);
                                    controller.updateList();
                                  },
                                  icon: controller.todoList[index].completed
                                      ? const Icon(Icons.check)
                                      : const Icon(null),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: 'Alert',
                                      middleText:
                                          "Are You Sure You Want To Delete this Task",
                                      contentPadding: const EdgeInsets.all(20),
                                      middleTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      backgroundColor: Colors.blue.shade100,
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            Get.back();
                                            await controller.deleteTodo(
                                                controller.todoList[index].id);
                                            controller.todoList.removeAt(index);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                          ),
                                          child: controller.isLoding
                                              ? const CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                )
                                              : const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue),
                                          child: const Text(
                                            "Cancel",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addTodoScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
