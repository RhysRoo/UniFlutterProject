import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'test_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Login()));
}

class Login extends StatelessWidget {
  // Controllers should be final if they are in a StatelessWidget
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            // ... Other UI elements ...

            // Email TextField
            Align(
              alignment: const Alignment(0.0, -0.2),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                color: Colors.cyan[700],
                child: TextField(
                  controller: _emailController, // Attached email controller
                  keyboardType: TextInputType.emailAddress, // Email keyboard
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                    // ... Other decoration properties
                  ),
                ),
              ),
            ),

            // Password TextField
            Align(
              alignment: const Alignment(0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                color: Colors.cyan[700],
                child: TextField(
                  controller:
                      _passwordController, // Attached password controller
                  obscureText: true, // Hides password
                  decoration: const InputDecoration(
                    labelText: 'Enter Password',
                    // ... Other decoration properties
                  ),
                ),
              ),
            ),

            // Login Button
            Align(
              alignment: const Alignment(0.0, 0.35),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      // Sign in with email and password
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      // On Success, navigate to TestHomePage or your main app
                      if (credential.user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestHomePage()),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      // Handle errors from Firebase
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                              'Invalid email or password.\nPlease try again.',
                              style: TextStyle(fontSize: 20)),
                        ),
                      );
                    }
                  },
                  child: const Text('Log-in'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
