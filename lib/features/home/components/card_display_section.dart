import 'package:flutter/material.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/constants.dart';

class CardDisplaySection extends StatelessWidget {
  const CardDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img.png',
                ),
              ),
              gradient: const LinearGradient(colors: [
                Color(0xffF0C735),
                Color(0xffD98F39),
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_1.png',
                ),
              ),
              gradient: LinearGradient(colors: [
                silverC1,
                silverC2,
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img.png',
                ),
              ),
              gradient: const LinearGradient(colors: [
                Color(0xffF0C735),
                Color(0xffD98F39),
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_1.png',
                ),
              ),
              gradient: LinearGradient(colors: [
                silverC1,
                silverC2,
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img.png',
                ),
              ),
              gradient: const LinearGradient(colors: [
                Color(0xffF0C735),
                Color(0xffD98F39),
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_1.png',
                ),
              ),
              gradient: LinearGradient(colors: [
                silverC1,
                silverC2,
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img.png',
                ),
              ),
              gradient: const LinearGradient(colors: [
                Color(0xffF0C735),
                Color(0xffD98F39),
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_1.png',
                ),
              ),
              gradient: LinearGradient(colors: [
                silverC1,
                silverC2,
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img.png',
                ),
              ),
              gradient: const LinearGradient(colors: [
                Color(0xffF0C735),
                Color(0xffD98F39),
              ])),
        ),
        Container(
          height: pH(200, context),
          width: pW(140, context),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_1.png',
                ),
              ),
              gradient: LinearGradient(colors: [
                silverC1,
                silverC2,
              ])),
        ),
      ],
    );
  }
}
