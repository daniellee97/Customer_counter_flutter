import 'package:flutter/material.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({super.key, this.saveCustomerHistory, this.customerCount});
  final saveCustomerHistory;
  final customerCount;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Do you want to save?'),
          content: const Text(
              'Do you want to save the current number of customer as the final number for today? '),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.greenAccent[400]),
              onPressed: () {
                saveCustomerHistory(DateTime.now().toLocal());
                Navigator.pop(context, 'Save');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.save),
    );
  }
}
