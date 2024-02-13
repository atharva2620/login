import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Error handling while sign in or sign up
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome Back!', style: TextStyle(
                color: Colors.white,
                fontSize: 28
            )),
            const SizedBox(height: 10),
            const Text('Log into your account', style: TextStyle(
                color: Colors.white
            )),
            const SizedBox(height: 30),

            // Email input step
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Enter the Email ID',
                  errorText: _emailError
              ),
            ),
            const SizedBox(height: 10),

            // Password input step
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter Password',
                  errorText: _passwordError
              ),
            ),

            // Forgot password
            TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?',
                    style: TextStyle(color: Colors.white))
            ),

            // Log in
            ElevatedButton(
              onPressed: _validateAndLogin,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue
              ),
              child: const Text('Login'),
            ),

            // Sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.white))
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Input validation at the time of login with null errors
  void _validateAndLogin() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    // Email validation
    if (_emailController.text.isEmpty ||
        !_emailController.text.contains('@')) {
      setState(() {
        _emailError = 'Please enter a valid email';
      });
      return;
    }

    // Password validation
    if (_passwordController.text.length < 8) {
      setState(() {
        _passwordError = 'Password must be at least 8 characters';
      });
      return;
    }

    // If valid, navigate the user to dashboard
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }

}