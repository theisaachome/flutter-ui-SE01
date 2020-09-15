import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:walletapp/styles/style_guide.dart';

class TransactionWidget extends StatelessWidget {
  final String label;
  final String amount;
  final bool isIncome;

  const TransactionWidget({Key key, this.label, this.amount, this.isIncome})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: isIncome ? color3 : color2, shape: BoxShape.circle),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              label,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "\$ $amount",
              style: transactionAmountTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
