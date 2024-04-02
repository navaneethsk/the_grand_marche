import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_grand_marche/core/constants/colors/palletes.dart';
import 'package:the_grand_marche/core/constants/pictures/pictures.dart';
import 'package:the_grand_marche/features/home_screen/screen/home_screen.dart';
import 'package:the_grand_marche/features/login_screen/login_screen.dart';
import 'package:the_grand_marche/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  loggedInCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool('login') ?? false;
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                loggedIn == false ? const LoginScreen() : const HomeScreen(),
          ));
    });
  }

  @override
  void initState() {
    loggedInCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: width * .15,
              width: width * .15,
              child: Image.asset(Pictures.shoppingCart),
            ),
            SizedBox(
              width: width * .03,
            ),
            Text(
              "|",
              style:
                  TextStyle(fontSize: width * .1, color: Colors.amber.shade300),
            ),
            SizedBox(
              width: width * .03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The",
                  style: TextStyle(
                      fontSize: width * .035,
                      color: Colors.amber.shade300,
                      fontStyle: FontStyle.italic),
                ),
                Row(
                  children: [
                    Text(
                      "Grand",
                      style: TextStyle(
                          fontSize: width * .06,
                          fontWeight: FontWeight.w700,
                          color: Pallets.orange),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Text(
                      "Marche",
                      style: TextStyle(
                          fontSize: width * .06,
                          fontWeight: FontWeight.w700,
                          color: Pallets.blue),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
