import 'package:flutter/material.dart';
import 'package:untitled1/home_page.dart';
import 'test_home.dart';

void main() {
  runApp(const MaterialApp(
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Align(
                alignment: const Alignment(0.0, 0.1),
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(10))),
                )),
            Align(
              //Username
              alignment: const Alignment(0.0, -0.2),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                color: Colors.cyan[700],
                child: const TextField(
                  style: TextStyle(fontSize: 19.0),
                  decoration: InputDecoration(
                      labelText: 'Enter Username',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                ),
              ),
            ),
            Align(
              //Password
              alignment: const Alignment(0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                color: Colors.cyan[700],
                child: const TextField(
                  style: TextStyle(fontSize: 19.0),
                  decoration: InputDecoration(
                      labelText: 'Enter Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.35),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: ElevatedButton(
                  child: const Text('Log-in'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TestHomePage()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
