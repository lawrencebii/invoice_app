import 'package:flutter/material.dart';
import 'package:invoice_app/Utils/Constants.dart';

import '../../../utils/colors.dart';

class TransactionTile extends StatelessWidget {
  final transaction;
  const TransactionTile({this.transaction});

  String getInvoiceNo() {
    try {
      return transaction['invoice_id'];
    } catch (e) {
      return "10";
    }
  }

  String getDateString() {
    try {
      return formatDateTime(transaction['created_at']);
    } catch (e) {
      return "";
    }
  }

  String getTransId() {
    try {
      return transaction['transaction_id'];
    } catch (e) {
      return "";
    }
  }

  String getAmount() {
    try {
      return transaction['amount'];
    } catch (e) {
      return "";
    }
  }

  String getStatus() {
    try {
      return transaction['amount'];
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            getTransId(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "KSH ${getAmount()}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            getStatus(),
            style: TextStyle(fontSize: 8, color: primaryColor),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Invoice No. IN00${getInvoiceNo()}"),
          Text(
            getDateString(),
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
