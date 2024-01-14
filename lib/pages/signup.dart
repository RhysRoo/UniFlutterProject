import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatelessWidget {
  // Controllers should be final if they are in a StatelessWidget
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.85),
              child: Text(
                'Welcome to Social App\n     Registration Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.7),
              child: Text(
                '     Before we start, let\'s get you seen. \n below could you upload a profile picture\n                              for us :)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.53),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 80,
              ),
            ),
            Column(children: [
              SizedBox(height: 300),
              Align(
                alignment: Alignment(-0.8, 0.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
