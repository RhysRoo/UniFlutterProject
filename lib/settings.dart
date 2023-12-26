import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void logInButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

String getUserEmail() {
  final user = FirebaseAuth.instance.currentUser;
  return user?.email ?? 'No user signed in';
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userEmail = getUserEmail();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.grey[600],
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topLeft, children: [
            Align(
              alignment: const Alignment(-0.0, -0.6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    width: 160,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    alignment: const Alignment(0.0, 0.0),
                    child: const Text("Profile"),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Container(
                          height: 35,
                          width: 240,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: Text(
                            userEmail,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          height: 26,
                          width: 240,
                          // color: Colors.blue,
                          alignment: const Alignment(0.0, 0.0),
                          child: const Text("Followers: 2"),
                        ),
                        Container(
                          height: 26,
                          width: 240,
                          // color: Colors.pink,
                          alignment: const Alignment(0.0, 0.0),
                          child: const Text("Post Likes: 1"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.3),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      //Log out button

                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                          onPressed: (() {
                            logInButtonHandler(context);
                          }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[900]),
                          child: const Text(
                            'Log Out',
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      //Change Name button
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.95,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                          onPressed: (() {
                            logInButtonHandler(context);
                          }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[800]),
                          child: const Text(
                            'Change Name',
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      //Change Profile Pic button
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.95,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                          onPressed: (() {
                            logInButtonHandler(context);
                          }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[700]),
                          child: const Text(
                            'Change Profile Picture',
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
