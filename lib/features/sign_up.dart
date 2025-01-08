import 'package:flutter/material.dart';

import '../core/theme/app_pallet.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController unitUsageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "SIGN UP NOW",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.secondaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Email Address Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email, color: AppPalette.secondaryColor),
                ),
              ),
              const SizedBox(height: 20),
              // Password Field
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock, color: AppPalette.secondaryColor),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // Phone Number Field
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone, color: AppPalette.secondaryColor),
                ),
              ),
              const SizedBox(height: 20),
              // Last 3 Months Unit Usage Field
              TextField(
                controller: unitUsageController,
                decoration: InputDecoration(
                  labelText: "Last 3 months Unit Usage",
                  prefixIcon: Icon(Icons.access_time, color: AppPalette.secondaryColor),
                ),
              ),
              const SizedBox(height: 30),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Handle sign-up logic here
                  final email = emailController.text;
                  final password = passwordController.text;
                  final phoneNumber = phoneNumberController.text;
                  final unitUsage = unitUsageController.text;

                  // Print values for testing
                  print('Email: $email');
                  print('Password: $password');
                  print('Phone Number: $phoneNumber');
                  print('Unit Usage: $unitUsage');

                  // Add your logic for sign-up
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // Login Text
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login_with_state'); // Assuming you have a login route
                },
                child: Text(
                  "Already have an account? LOGIN",
                  style: TextStyle(
                    color: AppPalette.secondaryColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    unitUsageController.dispose();
    super.dispose();
  }
}