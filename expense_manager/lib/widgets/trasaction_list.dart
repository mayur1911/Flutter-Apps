import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/trasnaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/image1.jpg',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: _deleteTransaction,
                    )
                  ).toList());
  }
}

/*
ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions[index],
                deleteTransaction: _deleteTransaction,
              );
            },
            itemCount: transactions.length,
          );
*/

/*

Replaced program with of Card with ListTile

ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),


*/

/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasnaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added !!!!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 50,),
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/image1.jpg",
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        margin: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).accentColor,
                              width: 4,
                              style: BorderStyle.solid),
                        ),
                        child: Text(
                          ' ${transactions[index].amount.toStringAsFixed(3)} \$',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Text(
                              transactions[index].name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                DateFormat.yMMMMd()
                                    .format(transactions[index].date),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
 */
/*

return Container(
      height: 300,
      child: ListView(
        children: transactions.map((tranct) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  margin: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.green, width: 4, style: BorderStyle.solid),
                  ),
                  child: Text(
                    ' ${tranct.amount} \$',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        tranct.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Text(
                          DateFormat.yMMMMd().format(tranct.date),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        )),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );


*/
