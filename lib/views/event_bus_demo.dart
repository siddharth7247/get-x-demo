import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/services/event_bus_services.dart';
import 'package:getx_demo/utils/increment_event.dart';
import 'package:getx_demo/views/event_fire.dart';

class EventBusDemo extends StatefulWidget {
  const EventBusDemo({super.key});

  @override
  State<EventBusDemo> createState() => _EventBusDemoState();
}

class _EventBusDemoState extends State<EventBusDemo> {
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  int counter4 = 0;
  @override
  void initState() {
    super.initState();
    EventBusService.eventBus.on<IncrementEvent>().listen((event) {
      setState(() {
        switch (event.index) {
          case 1:
            {
              counter1 = event.incrementValue;
            }
          case 2:
            {
              counter2 = event.incrementValue;
            }
          case 3:
            {
              counter3 = event.incrementValue;
            }
          case 4:
            {
              counter4 = event.incrementValue;
            }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Bus Demo"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter1,
              index: 1,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter1.toString()),
                ),
                title: const Text('Total Employee'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter2,
              index: 2,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter2.toString()),
                ),
                title: const Text('Total Employee'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter3,
              index: 3,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter3.toString()),
                ),
                title: const Text('Total Employee'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter4,
              index: 4,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter4.toString()),
                ),
                title: const Text('Total Employee'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
