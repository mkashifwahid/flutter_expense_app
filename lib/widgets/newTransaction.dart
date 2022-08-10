import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void SubmitData() {
    String titleText = titleController.text;
    double amountText = double.parse(amountController.text);

    if (titleText.isEmpty || amountText <= 0) {
      return;
    }

    widget.addNewTransaction(
      titleText,
      amountText,
    );
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => SubmitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                // onChanged: (value) => amountInput = value,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => SubmitData(),
              ),
              TextButton(
                  onPressed: SubmitData, child: const Text('Add Transaction'))
            ]),
      ),
    );
  }
}
