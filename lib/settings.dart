import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topLeft, children: [
            Align(
              alignment: const Alignment(-0.0, -0.95),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    alignment: const Alignment(0.0, 0.0),
                    child: const Text("Profile"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 78,
                    width: 240,
                    color: Colors.deepOrangeAccent,
                    child: Column(
                      children: [
                        Container(
                          height: 26,
                          width: 240,
                          // color: Colors.red,
                          alignment: const Alignment(0.0, 0.0),
                          child: const Text("@ Rhys1997"),
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
              alignment: const Alignment(0.0, 0.65),
              child: Container(
                height: 600,
                width: 410,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: const Alignment(0.0, 0.0),
                child: const Text('Settings UI & Buttons'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
