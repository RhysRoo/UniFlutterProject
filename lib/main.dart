import 'package:flutter/material.dart';
import 'package:untitled1/database/firebase_options.dart';
// import 'package:flutter/services.dart';
// import 'node.dart';
import 'pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

// List<Node> decisionMap = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      home: Login(),
    ),
  );
}
