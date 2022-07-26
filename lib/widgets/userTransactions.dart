import 'package:flutter/material.dart';
import './newTransaction.dart';
import './transactions_list.dart';
import '../models/transactions.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> transactions = [
    Transactions(
      id: '1',
      title: 'New Shoes',
      amount: 130,
      date: DateTime.now(),
    ),
    Transactions(
      id: '2',
      title: 'Home Grocerrcies',
      amount: 60.95,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final addNewTx = Transactions(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(addNewTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
