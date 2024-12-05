import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/home_screen_controller.dart';
import 'package:getx_demo/custom%20widgets/custom_textfield.dart';
import 'package:getx_demo/models/todos_model.dart';

class AddTodosScreen extends StatefulWidget {
  const AddTodosScreen({super.key});

  @override
  State<AddTodosScreen> createState() => _AddTodosScreenState();
}

class _AddTodosScreenState extends State<AddTodosScreen> {
  TextEditingController todoController = TextEditingController();
  TextEditingController deseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void validate() {
    if (_formKey.currentState!.validate()) {
      setState(
        () {
          isValid = true;
          log("Set state called");
        },
      );
    }
  }

  void clear() {
    todoController.clear();
    deseController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Task"),
      ),
      body: Center(
        child: GetBuilder<HomeScreenController>(
          id: 'main',
          init: HomeScreenController(),
          builder: (controller) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/todo2.png'),
                  CustomTextfield(
                    controller: todoController,
                    hintText: 'Enter Task title',
                    icon: Icons.task,
                    validator: 'Title',
                  ),
                  CustomTextfield(
                    controller: deseController,
                    hintText: 'Enter Task Description',
                    icon: Icons.description,
                    validator: 'Description',
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      validate();
                      log("Is valid :$isValid");
                      if (isValid) {
                        await controller.addTodo(
                            todoController.text, deseController.text);
                        controller.todoList.add(TodosModel(userId: 1, id: controller.todoList.length + 1, title: todoController.text, completed: false),);
                        clear();
                        Navigator.pop(context);
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: controller.isLoding
                        ? const CircularProgressIndicator(strokeWidth: 2,color: Colors.white)
                        : const Text(
                            "Add Task",
                            style: TextStyle(color: Colors.white),
                          ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
