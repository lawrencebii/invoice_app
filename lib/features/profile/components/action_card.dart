import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/utils/constants.dart';

class ActionCard extends StatelessWidget {
  final tag;
  final svg;
  const ActionCard({super.key, this.tag, this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: pW(354, context),
      height: pH(70, context),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.05))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/${svg}.svg',
          ),
          SizedBox(
            width: pW(10, context),
          ),
          Text(
            tag,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(child: SizedBox()),
          SvgPicture.asset(
            'assets/icons/forward.svg',
          ),
        ],
      ),
    );
  }
}
