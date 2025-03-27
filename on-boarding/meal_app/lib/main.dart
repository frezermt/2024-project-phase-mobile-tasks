import 'package:flutter/material.dart';
import 'package:meal_app/home_page.dart';

var kColorSchema = ColorScheme.fromSeed(
  seedColor: Colors.amberAccent,
);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.from(colorScheme: kColorSchema).copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: kColorSchema.primary),
    home: HomePage(),
  ));
}
