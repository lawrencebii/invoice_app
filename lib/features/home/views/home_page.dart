import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/features/home/components/card_display_section.dart';
import 'package:invoice_app/features/home/components/invoice_card.dart';
import 'package:invoice_app/features/home/home_provider.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../utils/petite_storage.dart';
import '../../authentication/authentication_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().getInvoices(context);
    });
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
        leading: GestureDetector(
          onTap: () {
            context.read<HomeProvider>().getInvoices(context);
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.all(13),
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
        ),
        title: Text("Invoices"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/notification.svg',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer2<LocalAuthenticationProvider, HomeProvider>(
          builder: (context, provider, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spaceY,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome, ${getName().split(' ').firstOrNull}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (value.isLoadingt)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (value.invoices != null && value.invoices != [])
                    ...List.generate(value.invoices.length, (index) {
                      return InvoiceCard(
                        invoice: value.invoices[index],
                      );
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
