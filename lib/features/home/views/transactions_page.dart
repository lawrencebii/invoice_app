import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/features/home/components/card_display_section.dart';
import 'package:invoice_app/features/home/components/invoice_card.dart';
import 'package:invoice_app/features/home/components/transaction_tile.dart';
import 'package:invoice_app/features/home/home_provider.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../utils/petite_storage.dart';
import '../../authentication/authentication_provider.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String getName() {
    try {
      final user = jsonDecode(StorageUtil.getString(key: 'user'));
      return user['name'];
    } catch (e) {
      return StorageUtil.getString(key: 'name');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // if (mounted) {
    //   context.read<HomeProvider>().getTransactions(context);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var spaceY = SizedBox(
      height: pH(20, context),
    );
    return Scaffold(
      backgroundColor: profileBackground,
      appBar: AppBar(
        backgroundColor: profileBackground,
        leading: Padding(
          padding: const EdgeInsetsDirectional.all(13),
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
          ),
        ),
        title: Text("Transactions"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  if (provider.isLoadingt)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (provider.transactions != null &&
                      provider.transactions.isNotEmpty)
                    ...List.generate(provider.transactions.length, (index) {
                      return TransactionTile(
                          transaction: provider.transactions[index]);
                    }),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ).animate().fadeIn(),
            );
          },
        ),
      ),
    );
  }
}
