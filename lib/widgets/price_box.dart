import 'package:flutter/material.dart';
import 'package:usd_rate/constants.dart';

class PriceBox extends StatelessWidget {
  final String action;
  final int price;
  final bool isIncrease;
  const PriceBox({
    Key? key,
    required this.action,
    required this.price,
    required this.isIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        color: kPrimarySoftColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            color: kPrimaryLightColor,
            offset: Offset(0, 7),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(
          style: BorderStyle.solid,
          color: kButtonsInActiveColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                action,
                style: const TextStyle(
                  fontSize: 23,
                  color: kDarkTitleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                  price == 0
                      ? Icons.warning
                      : isIncrease
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                  size: 25,
                  color: price == 0
                      ? kDarkTitleTextColor
                      : (isIncrease ? kIncreaseRateColor : kDecreaseRateColor)),
            ],
          ),
          const SizedBox(height: 10),
          price == 0
              ? const SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator(color: kButtonsActiveColor),
                )
              : Text(
                  '$price',
                  style: TextStyle(
                    fontSize: 32,
                    color: price == 0
                        ? kDarkTitleTextColor
                        : (isIncrease
                            ? kIncreaseRateColor
                            : kDecreaseRateColor),
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
