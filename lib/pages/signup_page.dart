import 'package:flutter/material.dart';
import 'login_page.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';

//MANUAL CHANGES NEEDED

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Icon
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(Icons.add, color: primary, size: 36),
                ),
              ),

              const SizedBox(height: 32),

              // Title
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  'Join T3xNova for real-time ambulance\ntracking and fleet management.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 40),

              // Full Name
              const Text('Full Name',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const InputField(
                icon: Icons.person_outline,
                hint: 'John Doe',
              ),

              const SizedBox(height: 20),

              // Email
              const Text('Email Address',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const InputField(
                icon: Icons.mail_outline,
                hint: 'name@example.com',
              ),

              const SizedBox(height: 20),

              // Password
              const Text('Password',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const InputField(
                icon: Icons.lock_outline,
                hint: 'Create a password',
                obscure: true,
              ),

              const SizedBox(height: 20),

              // Terms
              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: primary),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: primary),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 24),

              // Create Account button
              Center(
                child: PrimaryButton(
                  text: 'Create Account',
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder:(_) => const SignInScreen()));
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Divider
              Center(
                child: Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('OR SIGN UP WITH'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Social buttons (UI only)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Google'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Apple'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Back to login
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text('Already have an account? Sign in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
