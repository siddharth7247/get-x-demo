import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/services/event_bus_services.dart';
import 'package:getx_demo/utils/increment_event.dart';

class EventFireScreen extends StatelessWidget {
  EventFireScreen({super.key, required this.counter, required this.index});
  int counter;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  counter++;
                  EventBusService.eventBus.fire(IncrementEvent(counter, index));
                  Get.back();
                },
                child: const Text('Add Employee'))
          ],
        ),
      ),
    );
  }
}
