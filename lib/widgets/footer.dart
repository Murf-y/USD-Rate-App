import "package:flutter/material.dart";
import 'package:usd_rate/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.black38,
                width: 1.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Text(
                      'Made with ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: kLightBodyTextColor,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: kButtonsActiveColor,
                      size: 18.0,
                    ),
                    Text(
                      ' By Murf             © 2022',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: kLightBodyTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
