import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/event%20bus/decrement_event.dart';
import 'package:getx_demo/event%20bus/event_bus_services.dart';
import 'package:getx_demo/event%20bus/increment_event.dart';
import 'package:getx_demo/event%20bus/event_fire.dart';

class EventBusDemo extends StatefulWidget {
  const EventBusDemo({super.key});

  @override
  State<EventBusDemo> createState() => _EventBusDemoState();
}

class _EventBusDemoState extends State<EventBusDemo> {
  int counter_1 = 0;
  int counter_2 = 0;
  int counter_3 = 0;
  int counter_4 = 0;
  @override
  void initState() {
    super.initState();
    EventBusService.eventBus.on<IncrementEvent>().listen(
      (event) {
        setState(
          () {
            switch (event.index) {
              case 1:
                {
                  counter_1 = event.incrementValue;
                }
              case 2:
                {
                  counter_2 = event.incrementValue;
                }
              case 3:
                {
                  counter_3 = event.incrementValue;
                }
              case 4:
                {
                  counter_4 = event.incrementValue;
                }
            }
          },
        );
      },
    );
    EventBusService.eventBus.on<DecrementEvent>().listen(
      (event) {
        setState(
          () {
            switch (event.index) {
              case 1:
                {
                  counter_1 = event.decrementValue;
                }
              case 2:
                {
                  counter_2 = event.decrementValue;
                }
              case 3:
                {
                  counter_3 = event.decrementValue;
                }
              case 4:
                {
                  counter_4 = event.decrementValue;
                }
            }
          },
        );
      },
    );
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
              counter: counter_1,
              index: 1,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter_1.toString()),
                ),
                title: const Text('Total Employee'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter_2,
              index: 2,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter_2.toString()),
                ),
                title: const Text('Total Manager'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter_3,
              index: 3,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter_3.toString()),
                ),
                title: const Text('Total Developers'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(EventFireScreen(
              counter: counter_4,
              index: 4,
            )),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(counter_4.toString()),
                ),
                title: const Text('Total Designer'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
