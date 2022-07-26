import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                // onChanged: (value) => titleInput = value,
                controller: titleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                // onChanged: (value) => amountInput = value,
                controller: amountController,
              ),
              TextButton(
                  onPressed: () {
                    addNewTransaction(
                      titleController.text,
                      double.parse(amountController.text),
                    );
                  },
                  child: const Text('Add Transaction'))
            ]),
      ),
    );
  }
}
