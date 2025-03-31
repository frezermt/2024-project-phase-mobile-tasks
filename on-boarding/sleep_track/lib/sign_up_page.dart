import 'package:flutter/material.dart';
import 'package:sleep_track/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Create New Account',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Enter your full name'),
              ),
              SizedBox(
                height: 15,
              ),
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
                              : Icons.visibility)))),
              SizedBox(
                height: 15,
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                ' Phone number',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                controller: _phoneController,
                decoration:
                    InputDecoration(labelText: 'Enter your Phone number'),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  'OR',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRect(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/facebook.png',
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width *
                            0.08, // 8% of screen width
                        maxHeight: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ClipRect(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/google.png',
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width *
                            0.08, // 8% of screen width
                        maxHeight: MediaQuery.of(context).size.width * 0.08,
                      ),
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
                              builder: (context) => SignInPage(),
                            ));
                      },
                      child: Text(
                        'Sign In',
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
      ),
    );
  }
}
