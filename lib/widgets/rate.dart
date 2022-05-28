import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:usd_rate/api.dart';
import 'package:usd_rate/constants.dart';
import 'package:usd_rate/widgets/price_box.dart';

Future getDollarRate() async {
  final response = await requestDollarRate();
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return;
  }
}

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  var buy_rate = 0;
  var sell_rate = 0;
  var old_buy_rate = 38000;
  var old_sell_rate = 38000;
  var isIncrease = true;
  var last_updated_time = DateTime.now();

  void updateData() {
    getDollarRate().then((value) {
      setState(() {
        old_buy_rate = buy_rate;
        old_sell_rate = sell_rate;

        value['buy_rate'] = value['buy_rate'].replaceAll(',', '');
        value['sell_rate'] = value['sell_rate'].replaceAll(',', '');
        buy_rate = int.parse(value['buy_rate']);
        sell_rate = int.parse(value['sell_rate']);
        if (buy_rate < old_buy_rate) {
          isIncrease = false;
        }
        if (buy_rate > old_buy_rate) {
          isIncrease = true;
        }
        last_updated_time = DateTime.now();
      });
    });
  }

  @override
  initState() {
    super.initState();
    getDollarRate().then((value) {
      setState(() {
        old_buy_rate = buy_rate;
        old_sell_rate = sell_rate;

        value['buy_rate'] = value['buy_rate'].replaceAll(',', '');
        value['sell_rate'] = value['sell_rate'].replaceAll(',', '');
        buy_rate = int.parse(value['buy_rate']);
        sell_rate = int.parse(value['sell_rate']);
        if (buy_rate < old_buy_rate) {
          isIncrease = false;
        }
        if (buy_rate > old_buy_rate) {
          isIncrease = true;
        }
        last_updated_time = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: kPrimaryLightColor,
            boxShadow: [
              BoxShadow(
                color: isIncrease ? kIncreaseRateColor : kDecreaseRateColor,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, -1), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Last updated:   ${last_updated_time.hour}:${last_updated_time.minute}      ${last_updated_time.day}/${last_updated_time.month}/${last_updated_time.year}",
              style: const TextStyle(
                fontSize: 15,
                color: kDarkTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PriceBox(action: "Buy", price: buy_rate, isIncrease: isIncrease),
            // Refresh icon
            IconButton(
              onPressed: () {
                updateData();
              },
              icon: const Icon(
                Icons.compare_arrows_outlined,
                size: 50,
                color: kPrimaryLightColor,
              ),
            ),
            const SizedBox(width: 4),
            PriceBox(action: "Sell", price: sell_rate, isIncrease: isIncrease),
          ],
        ),
      ],
    );
  }
}
