import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logicaltestmain_main/home_page.dart';
import 'package:logicaltestmain_main/loginpage.dart';
import 'package:provider/provider.dart';

import 'curiosidades.dart';
import 'register/model/auth.dart';
import 'register/splash_page.dart';
import 'register/staps/five_page.dart';
import 'register/staps/four_page.dart';
import 'register/staps/one_page.dart';
import 'register/staps/seven_page.dart';
import 'register/staps/six_page.dart';
import 'register/staps/three_page.dart';
import 'register/staps/two_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MATH\'',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/LoginPage': (context) => LoginPage(),
          '/jogo1': (context) => OnePage(),
          '/jogo2': (context) => TwoPage(),
          '/jogo3': (context) => ThreePage(),
          '/jogo4': (context) => FourPage(),
          '/jogo5': (context) => FivePage(),
          '/jogo6': (context) => SixPage(),
          '/jogo7': (context) => SevenPage(),
          'curiosidades': (context) => CuriosidadesPage(),
        },
      ),
    );
  }
}
