import 'package:flutter/material.dart';
import 'package:sleep_track/home_page.dart';
import 'package:sleep_track/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Korem ipsum dolor sit amet,consectetur adipiscing elit.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                      labelText: 'Enter your Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                          icon: Icon(_isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Sign in')),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'OR',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8), // Optional, if you want rounded corners
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/facebook.png'),
                        constraints: BoxConstraints(
                            minWidth: 30,
                            minHeight: 30,
                            maxWidth: 49,
                            maxHeight: 49),
                        padding: EdgeInsets.zero, // Removes default padding
                      ),
                    ),
                    SizedBox(width: 25),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/google.png'),
                        constraints: BoxConstraints(
                          minWidth: 30,
                          minHeight: 30,
                          maxWidth: 40,
                          maxHeight: 40,
                        ),
                        padding: EdgeInsets.zero, // Removes default padding
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ));
                        },
                        child: Text(
                          'Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 15),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
