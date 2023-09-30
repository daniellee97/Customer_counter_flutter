import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerHistoryScreen extends StatelessWidget {
  const CustomerHistoryScreen({super.key, this.customerHistory});
  final customerHistory;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('MM/dd/yyyy 12H');
    return Scaffold(
        appBar: AppBar(title: const Text('Customer History')),
        body: Center(
          // child: Text(customerHistory.toString()),
          child: ListView(children: [
            for (var entry in customerHistory.entries) ...[
              ListTile(
                title: Text(DateFormat('MM/dd/yyyy HH:mm').format(entry.key)),
                subtitle: Text("Customers: ${entry.value.toString()}"),
              )
            ]
          ]),
        ));
  }
}
