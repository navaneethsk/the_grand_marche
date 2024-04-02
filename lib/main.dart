import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_grand_marche/core/common/splash_screen.dart';

// ignore: prefer_typing_uninitialized_variables
var width;
// ignore: prefer_typing_uninitialized_variables
var height;
bool loggedIn = false;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const MaterialApp(
        title: 'The Grand Marche',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
