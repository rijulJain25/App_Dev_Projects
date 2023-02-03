import 'package:pocket_check/widgets/transaction_item.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty 
    ? LayoutBuilder(builder: (ctx, constraints){
      return Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "No transactions added yet!", 
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: constraints.maxHeight*0.6,
            child: Image.asset(
              "assets/images/waiting.png", 
              fit: BoxFit.cover,
              color: Colors.grey[400],
            ),
          )
        ],
        );
    }) : 
      ListView.builder(
      itemBuilder: (ctx, index) {
        return TransactionItem(transactions: transactions[index], deleteTx: deleteTx);
      },
      itemCount: transactions.length,
    );
  }
}
