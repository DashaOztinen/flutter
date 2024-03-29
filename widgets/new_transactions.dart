// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget{
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 ){
      return;
    }

    
    widget.addTx(
      enteredTitle,
      enteredAmount,
      );
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
      child: 
      Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData(),
            //onChanged: (val) {
             // titleInput = val;
            //},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            //onChanged: (val) => amountInput = val,
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            onPressed: submitData,
            child: Text('Add Transaction', 
            style: TextStyle(color: Colors.purple),
            ),
            ),
        ],
        ),
      ),
      );
  }
}