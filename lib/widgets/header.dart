import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usd_rate/constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: kPrimaryLightColor,
            blurRadius: 10,
            spreadRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'USD Rate',
                style: TextStyle(
                  fontSize: 38,
                  color: kDarkTitleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.monetization_on,
                size: 50,
                color: kButtonsActiveColor,
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/Finance.svg',
            fit: BoxFit.contain,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
        ],
      ),
    );
  }
}
