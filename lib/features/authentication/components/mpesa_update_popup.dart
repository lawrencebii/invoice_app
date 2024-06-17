import 'package:flutter/material.dart';
import 'package:invoice_app/Utils/Constants.dart';
import 'package:invoice_app/features/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import 'custom_field.dart';

Future<dynamic> showMpesaCodeDialog(
  BuildContext context,
  String inv_id,
) {
  return showDialog(
    context: context,
    builder: (context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.height;

      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets +
            EdgeInsets.only(
              left: 20,
              right: 20,
              top: height * 0.5,
              bottom: 0,
            ),
        duration: const Duration(microseconds: 2),
        curve: Curves.decelerate,
        child: Material(
          elevation: 0,
          type: MaterialType.card,
          // color: Theme.of(context).dialogBackgroundColor,
          color: Colors.transparent,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              return Container(
                height: 230,
                constraints: BoxConstraints(
                  maxHeight: 300,
                  minHeight: 230,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: ColorsConstants.bottomDisabled, width: 0.5)),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorsConstants.bottomDisabled),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Enter Mpesa Phone",
                                      ),
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 13),
                              TextFormFieldCustom(
                                // width: MediaQuery.sizeOf(context).width * .7,
                                height: 52,
                                keyboardType: TextInputType.number,
                                hintText: "M-pesa Phone Number",
                                controller: value.phoneController,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "Please enter Mpesa Number"
                                      : null;
                                },

                                onTap: () {},
                                onFieldSubmitted: (text) {},
                                onChanged: (text) {},
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Enter Amount",
                                      ),
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 13),
                              TextFormFieldCustom(
                                // width: MediaQuery.sizeOf(context).width * .7,
                                height: 52,
                                keyboardType: TextInputType.number,
                                hintText: "Amount",
                                controller: value.amountController,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? "Please enter the amount"
                                      : null;
                                },

                                onTap: () {},
                                onFieldSubmitted: (text) {},
                                onChanged: (text) {},
                              ),
                              const SizedBox(height: 25),
                              value.isLoadingt
                                  ? Center(child: CircularProgressIndicator())
                                  : Center(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            fixedSize:
                                                MaterialStateProperty.all<Size>(
                                                    Size(pW(300, context),
                                                        pH(50, context)))),
                                        onPressed: () async {
                                          if (value.phoneController.text
                                                  .isNotEmpty &&
                                              value.amountController.text
                                                  .isNotEmpty) {
                                            context
                                                .read<HomeProvider>()
                                                .sendStKPush(context, inv_id);
                                          }
                                        },
                                        child: Text("Confirm"),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
