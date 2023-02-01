// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:newprog/widgets/transaction_list.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
import './models/trasaction.dart';


void  main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

 // String titleInput;
  final List<Transaction> _userTransaction= [
    Transaction(
      id: 't1',
      title: 'new shoes',
      amount: 69.99, 
      date: DateTime.now(),
      ),

      Transaction(
      id: 't2',
      title: 'weakly groseries',
      amount: 16.99, 
      date: DateTime.now(),
      ),
      ];

      void _addNewTransaction (String txTitle, double txAmount){
        final newTx = Transaction (
          title: txTitle,
           amount: txAmount, 
           date: DateTime.now(),
           id: DateTime.now().toString(),
           );

           setState(() {
             _userTransaction.add(newTx);
           });
      }
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bCtx) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(_addNewTransaction),
        );
    },);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title:  Text('Flutter App'),
      actions:<Widget> [
        IconButton(
          onPressed:() =>  _startAddNewTransaction(context), 
          icon: Icon(Icons.add),
          ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.blue,
          elevation: 5,
          child: Text('Chart'),
        ),
      ),
      TransactionList(_userTransaction),
    ],
    ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: 
    FloatingActionButton(
      child: Icon(Icons.add), 
      onPressed: () =>  _startAddNewTransaction(context),
    ),
   );
  }
}