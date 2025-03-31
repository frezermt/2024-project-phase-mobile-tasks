import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_out_app/auth/auth_service.dart';
import 'package:sign_in_out_app/screens/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.cyan);
    
    return MaterialApp(
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
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.black, 
            fontSize: 20, 
            fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            color: kColorScheme.inversePrimary,
            fontSize: 25,
            fontWeight: FontWeight.bold),
        ),
      ),
      home: StreamBuilder<User?>(
        stream: Provider.of<AuthService>(context).authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage(); // Create this screen
          }
          return SignInPage();
        },
      ),
    );
  }
}