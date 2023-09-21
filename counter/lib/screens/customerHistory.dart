import 'package:flutter/material.dart';
import './historyCard.dart';

class CustomerHistoryScreen extends StatelessWidget {
  const CustomerHistoryScreen({super.key, this.customerHistory});
  final customerHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Customer History')),
        body: Center(
          // child: Text(customerHistory.toString()),
          child: Column(children: [
            for (var entry in customerHistory.entries) ...[
              ListTile(
                title: Text(entry.key.toString()),
                subtitle: Text(entry.value.toString()),
              )
            ]
          ]),
        ));
  }
}
