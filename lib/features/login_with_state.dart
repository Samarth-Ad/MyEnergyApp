import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_pallet.dart';

class LoginWithStatePage extends StatefulWidget {
  const LoginWithStatePage({super.key});

  @override
  State<LoginWithStatePage> createState() => _LoginWithStatePageState();
}

class _LoginWithStatePageState extends State<LoginWithStatePage> {
  bool isEmailLogin = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

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
              // Back Arrow Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppPalette.secondaryColor),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the previous page
                  },
                ),
              ),
              const SizedBox(height: 20),

              // App logo or Title
              Text(
                "Comp-Name",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.primaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Toggle between Email/Password and Phone/OTP login
              SwitchListTile(
                title: Text(isEmailLogin ? "Login with Email" : "Login with Phone"),
                value: isEmailLogin,
                onChanged: (value) {
                  setState(() {
                    isEmailLogin = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              if (isEmailLogin) ...[
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
              ] else ...[
                // Phone Number Field
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone, color: AppPalette.secondaryColor),
                  ),
                ),
                const SizedBox(height: 20),
                // OTP Field
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    labelText: "OTP",
                    prefixIcon: Icon(Icons.lock, color: AppPalette.secondaryColor),
                  ),
                  obscureText: true,
                ),
              ],
              const SizedBox(height: 30),

              // Proceed Button
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                  if (isEmailLogin) {
                    final email = emailController.text;
                    final password = passwordController.text;
                    print('Email: $email');
                    print('Password: $password');
                  } else {
                    final phoneNumber = phoneNumberController.text;
                    final otp = otpController.text;
                    print('Phone Number: $phoneNumber');
                    print('OTP: $otp');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "PROCEED",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}