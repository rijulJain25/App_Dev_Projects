import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {

  final Transaction transactions;
  final Function deleteTx;
  
  
  TransactionItem({
    Key key,
    @required this.transactions, 
    @required this.deleteTx,}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5,),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30, 
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text("₹${transactions.amount}"),
            ),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transactions.date)),
        trailing: MediaQuery.of(context).size.width>460 
        ? TextButton.icon(
           onPressed: () => deleteTx(transactions.id), 
           icon: Icon(Icons.delete), 
           label: Text("Delete"),
           style: TextButton.styleFrom(
                  foregroundColor: Colors.red[800], // Text Color
                ),
          )
          : IconButton(
          icon: Icon(Icons.delete), 
          color: Theme.of(context).errorColor, 
          onPressed: () => deleteTx(transactions.id),),
      ),
    );
  }
}
