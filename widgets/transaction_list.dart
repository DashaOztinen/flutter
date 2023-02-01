// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, override_on_non_overriding_member, no_logic_in_create_state
import 'package:flutter/material.dart';
import '../models/trasaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column (
        children: transactions.map((tx) {
        return Card(
          child: Row(children: <Widget>[

            Container (
              margin:  EdgeInsets.symmetric(
                vertical: 10,
                 horizontal: 15,
                 ),

                 decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                   width: 2,
                   ),
                   ),

                   padding:  EdgeInsets.all(10),

              child: Text(
                '\$${tx.amount.toStringAsFixed(2)}',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20, 
                  color: Colors.purple,
                ),
                ),
                ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(tx.title, 
                style: 
                 TextStyle(
                  fontSize: 15,
                   fontWeight: FontWeight.bold,
                   ),
                   ),
                   
                Text(
                  DateFormat.yMMMMEEEEd().format(tx.date),
                style:
                  TextStyle(
                  color: Colors.grey,
                  ),
                ),
              ],
              )
          ],
          ),
        );
        }).toList(),
        );
  }
  
  
}