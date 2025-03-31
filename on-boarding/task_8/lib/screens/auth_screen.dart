import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_8/blocs/auth/auth_bloc.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final email = state is AuthSuccess ? state.email : '';
          final password = state is AuthSuccess ? state.password : '';
          final showPassword = state is AuthSuccess ? state.showPassword : false;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Toggle between Login and Signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => setState(() => _isLogin = true),
                      style: TextButton.styleFrom(
                        foregroundColor: _isLogin ? Colors.blue : Colors.grey,
                      ),
                      child: const Text('Login'),
                    ),
                    TextButton(
                      onPressed: () => setState(() => _isLogin = false),
                      style: TextButton.styleFrom(
                        foregroundColor: !_isLogin ? Colors.blue : Colors.grey,
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) =>
                      context.read<AuthBloc>().add(EmailChanged(value)),
                ),

                const SizedBox(height: 16),

                // Password Field
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add( TogglePasswordVisibility()),
                    ),
                  ),
                  obscureText: !showPassword,
                  onChanged: (value) =>
                      context.read<AuthBloc>().add(PasswordChanged(value)),
                ),

                const SizedBox(height: 24),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_isLogin) {
                      context.read<AuthBloc>().add( LoginSubmitted());
                    } else {
                      context.read<AuthBloc>().add( SignUpSubmitted());
                    }
                  },
                  child: Text(_isLogin ? 'Login' : 'Sign Up'),
                ),

                const SizedBox(height: 32),

                // Display current state
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current State:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Email: $email'),
                        Text('Password: $password'),
                        Text('Show Password: $showPassword'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}