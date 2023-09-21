import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final date;
  final numOfCustomer;
  const HistoryCard({this.date, this.numOfCustomer});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Row(children: [
            Text(date),
            const Padding(
              padding: EdgeInsets.all(40),
            ),
            Text(numOfCustomer),
          ]),
        ));
  }
}
