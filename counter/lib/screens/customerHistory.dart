import 'package:flutter/material.dart';

class CustomerHistoryScreen extends StatelessWidget {
  const CustomerHistoryScreen({super.key, this.customerHistory});
  final customerHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Customer History')),
        body: Center(
          child: Text(customerHistory.toString()),
        ));
  }
}
