import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:invoice_app/features/authentication/views/create_account.dart';
import 'package:invoice_app/features/authentication/views/login_page.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/petite_storage.dart';

import '../../../utils/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: pH(150, context),
          ),
          Text(StorageUtil.getString(key: 'token')),
          Center(
            child: Image.asset("assets/images/onboard.png")
                .animate()
                .saturate(duration: Duration(milliseconds: 600))
                .scale(),
          ),
          SizedBox(
            height: pH(20, context),
          ),
          Text(
            "Invoice system with payment intergration.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: pH(10, context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Monitor and pay your invoices here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Color(0xff4F4F4F),
                fontWeight: FontWeight.w600,
              ),
            ),
          ).animate().scale(),
          SizedBox(
            height: pH(20, context),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateAccount()));
            },
            child: Container(
              height: 60,
              width: pW(354, context),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: pH(20, context),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
