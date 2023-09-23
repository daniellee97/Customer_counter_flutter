import 'dart:ffi';

import 'package:flutter/material.dart';
import 'saveDialog.dart';

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
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _incrementCounter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                child: Text(
                  'Customers on ${date.year}.${date.month}.${date.day}:',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                child: Text(
                  '$_counter',
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(20)),
                child: const Text(
                  'Customer Histories',
                  style: TextStyle(fontSize: 18),
                ),
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
