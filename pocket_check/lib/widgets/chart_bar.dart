import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerc;

  ChartBar(this.label, this.spendingAmount, this.spendingPerc);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight*0.12,
            child: FittedBox(
                child: Text(
              "\₹${spendingAmount.toStringAsFixed(0)}",
            )),
          ),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.66,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromARGB(255, 233, 233, 233),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPerc,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.12,
            child: FittedBox(child: Text(label))
          ),
        ],
      );
    });
  }
}
