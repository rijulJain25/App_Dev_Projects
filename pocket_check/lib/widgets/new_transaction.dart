import 'dart:io';

import './adaptive_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() {
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2023), 
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }setState(() {
        _selectedDate = pickedDate;
      });
      print("...");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
            child: Container(
              padding: EdgeInsets.only(
                top: 10, 
                left: 10, 
                right: 10, 
                bottom: MediaQuery.of(context).viewInsets.bottom+10
              ),
              child: Column(
                
            
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    controller: _titleController,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    controller: _amountController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => submitData(),
                  ),
                  Container(
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(_selectedDate == null ? 
                            "No date choosen!": 
                            'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                          ),
                        ),
                        AdaptiveFlatButton("Choose Date", _presentDatePicker),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Add Expense",
                    style: TextStyle(color: Colors.white),),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.purple, // Text Color
                    ),
                    onPressed: submitData,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
