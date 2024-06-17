import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/Utils/Constants.dart';
import 'package:invoice_app/features/authentication/components/mpesa_update_popup.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../home_provider.dart';

class InvoiceCard extends StatelessWidget {
  final invoice;

  const InvoiceCard({super.key, this.invoice});
  String formatDateTime(date) {
    DateTime dateTime = DateTime.parse(date);

    // Format the DateTime object to the desired output
    String formattedDate = DateFormat.jm().add_yMMM().format(dateTime);

    return formattedDate; // Returns "6:00 am Jun 24"
  }

  String getINvoiceNumber() {
    try {
      return invoice['id'].toString();
    } catch (e) {
      return '';
    }
  }

  String getTotalAmount() {
    try {
      return invoice['total_amount'].toString();
    } catch (e) {
      return '10';
    }
  }

  String getBalance() {
    try {
      return invoice['balance'].toString();
    } catch (e) {
      return '';
    }
  }

  String getStatus() {
    try {
      return invoice['status'];
    } catch (e) {
      return 'unpaid';
    }
  }

  String getDueDate() {
    try {
      return formatDateTime(invoice['due_date']);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pH(250, context),
      width: pW(380, context),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 10,
                color: primaryColor.withOpacity(0.05))
          ]),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Invoice Number",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "IN00${getINvoiceNumber()}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Due Date",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                getDueDate(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                getTotalAmount(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Status",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                getStatus(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<HomeProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return LinearProgressIndicator();
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Text(
                  //   "Balance - ${getBalance()}",
                  //   style: TextStyle(color: Colors.white70),
                  // ),
                  Expanded(child: SizedBox()),
                  if (getBalance() == '0')
                    Container(
                      height: pH(50, context),
                      width: pW(120, context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffFEFFFE)),
                      child: Center(
                        child: Text(
                          "Paid",
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  if (getBalance() != '0')
                    GestureDetector(
                      onTap: () {
                        context
                            .read<HomeProvider>()
                            .prefillControllers(getTotalAmount());
                        showMpesaCodeDialog(context, getINvoiceNumber());
                      },
                      child: Container(
                        height: pH(50, context),
                        width: pW(120, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffFEFFFE)),
                        child: Center(
                          child: Text(
                            "Pay now",
                            style: TextStyle(
                              fontSize: 14,
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
