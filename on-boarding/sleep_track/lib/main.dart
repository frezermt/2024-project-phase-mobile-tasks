import 'package:flutter/material.dart';
import 'package:sleep_track/sign_in_page.dart';

void main() {
  var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.cyan);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.from(
      colorScheme: kColorScheme,
    ).copyWith(
        scaffoldBackgroundColor: kColorScheme.onPrimary,
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromARGB(255, 224, 219, 219),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelStyle: TextStyle(color: Colors.black26)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primary,
              foregroundColor: kColorScheme.onPrimary,
              minimumSize: Size(double.infinity, 50),
              textStyle: TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
              color: kColorScheme.inversePrimary,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
    home: SignInPage(),
  ));
}
