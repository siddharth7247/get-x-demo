import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/event%20bus/decrement_event.dart';
import 'package:getx_demo/event%20bus/event_bus_services.dart';
import 'package:getx_demo/event%20bus/increment_event.dart';

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
              child: const Text('Add'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                counter--;
                EventBusService.eventBus.fire(DecrementEvent(counter, index));
                Get.back();
              },
              child: const Text('remove'),
            ),
          ],
        ),
      ),
    );
  }
}
