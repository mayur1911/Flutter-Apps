import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/trasnaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function _deleteTransaction;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required Function deleteTransaction,
  })  : _deleteTransaction = deleteTransaction,
        super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();

  
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.amber,
      Colors.blue,
      Colors.purple,
      Colors.green,
    ];
    setState(() {
       _bgColor = availableColors[Random().nextInt(4)];
    });
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 7,
      ),
      child: ListTile(
          leading: Card(
            elevation: 10,
            shadowColor: Color.fromRGBO(24, 30, 240, 0.98),
            /*
            instead of CircleAvatar
            child : Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).textTheme.title,
              ),
            ) 
            */
            child: CircleAvatar(
              radius: 25,
              backgroundColor: _bgColor,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  child: Text(
                    '\$${widget.transaction.amount.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
            ),
          ),
          title: Text('${widget.transaction.title}'),
          subtitle: Text(DateFormat.yMEd().format(widget.transaction.date)),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.blue.shade700,
            onPressed: () => widget._deleteTransaction(widget.transaction.id),
          )),
    );
  }
}
