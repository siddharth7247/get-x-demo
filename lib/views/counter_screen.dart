import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/counter_screen_controller.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final CounterScreenController _controller =
      Get.put(CounterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conter App Using Getx'),
      ),
      body: Center(
        child: Obx(
          () {
            return Text(_controller.counter.value.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
