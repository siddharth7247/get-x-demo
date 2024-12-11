import 'package:flutter/material.dart';

class EventBusDemo extends StatelessWidget {
  const EventBusDemo({super.key});

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
        children:  [
          InkWell(
            onTap: (){},
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('1'),
                ),
                title: Text('Total Employee'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('1'),
              ),
              title: Text('Total Employee'),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('1'),
              ),
              title: Text('Total Employee'),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('1'),
              ),
              title: Text('Total Employee'),
            ),
          )
        ],
      ),
    );
  }
}
