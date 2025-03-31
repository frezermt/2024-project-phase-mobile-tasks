import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_out_app/screens/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  Future<void> _signIn() async {
    try {
      await Provider.of<AuthService>(context, listen: false).signInWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () =>
                      setState(() => _isPasswordHidden = !_isPasswordHidden),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignUpPage())),
              child: Text('Create Account'),
            ),
            // Add Google/Facebook buttons here
          ],
        ),
      ),
    );
  }
}
