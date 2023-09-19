import 'package:flutter/material.dart';
import './saveDialog.dart';

import 'customerHistory.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  var _customerHistory = {};
  var date = DateTime.now();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addCustomerHistory(time) {
    setState(() {
      _customerHistory = {..._customerHistory, time: _counter};
      _resetCounter();
    });
    print(_customerHistory);
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _incrementCounter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Customers on ${date.year}.${date.month}.${date.day}:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                child: const Text('Customer History'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerHistoryScreen(
                              customerHistory: _customerHistory,
                            ))),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SaveDialog(
        saveCustomerHistory: _addCustomerHistory,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
