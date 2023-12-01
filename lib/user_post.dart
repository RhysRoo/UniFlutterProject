import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Post Information'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topLeft, children: [
            Align(
              alignment: const Alignment(-0.96, -0.98),
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: Colors.brown[300],
                  borderRadius: const BorderRadius.horizontal(),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.7, -0.2),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        child: const Text("FRIENDS"),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, -0.3),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.7, -0.2),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        child: const Text("PROFILE"),
                      ),
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
