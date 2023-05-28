import 'dart:async';
import 'package:flutter/material.dart';
import '../home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo1.png'),
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
              strokeWidth: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
