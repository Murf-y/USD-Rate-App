import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usd_rate/constants.dart';
import 'package:usd_rate/widgets/footer.dart';
import 'package:usd_rate/widgets/header.dart';
import 'package:usd_rate/widgets/rate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Popins',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Header(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Rate(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
