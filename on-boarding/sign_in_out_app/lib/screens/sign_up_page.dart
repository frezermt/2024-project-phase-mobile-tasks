import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_out_app/screens/sign_in_page.dart';
import 'package:sign_in_out_app/auth/auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isLoading = false;

  Future<void> _signUp() async {
    setState(() => _isLoading = true);

    try {
      await Provider.of<AuthService>(context, listen: false).signUpWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        name: _nameController.text.trim(),
      );
      // Success - AuthService will automatically update the stream
      // and redirect via main.dart's StreamBuilder
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await Provider.of<AuthService>(context, listen: false).signInWithGoogle();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await Provider.of<AuthService>(context, listen: false)
          .signInWithFacebook();
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
        automaticallyImplyLeading: false,
        title: Text(
          'Create New Account',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                Text(
                  'Full Name',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Email Field
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () => setState(
                          () => _isPasswordHidden = !_isPasswordHidden),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Phone Field (Optional)
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signUp,
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Sign Up', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 20),

                // OR Divider
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('OR',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),

                // Social Sign In
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Sign In
                      IconButton(
                        onPressed: _signInWithGoogle,
                        icon: Image.asset('assets/google.png', width: 40),
                      ),
                      const SizedBox(width: 25),

                      // Facebook Sign In
                      IconButton(
                        onPressed: _signInWithFacebook,
                        icon: Image.asset('assets/facebook.png', width: 40),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Already have account
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => SignInPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
