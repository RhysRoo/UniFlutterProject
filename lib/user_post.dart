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
              alignment: const Alignment(-0.0, -0.97),
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
                    child: const Text("User Picture"),
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
              alignment: const Alignment(0.0, -0.45),
              child: Container(
                height: 200,
                width: 410,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: const Alignment(0.0, 0.0),
                child: const Text('Post Message'),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.34),
              child: Container(
                height: 250,
                width: 410,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: const Alignment(0.0, 0.0),
                child: const Text("Comment Section"),
                // child: Column(
                //   children: [
                //     Container(
                //       height: 100,
                //       width: 410,
                //       color: Colors.deepOrange,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.693),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.purple,
                    height: 60,
                    minWidth: 150,
                    textColor: Colors.white,
                    child: const Icon(Icons.comment),
                  ),
                  const SizedBox(width: 30),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.purple,
                    height: 60,
                    minWidth: 150,
                    textColor: Colors.white,
                    child: const Icon(Icons.thumb_up_rounded),
                  ),
                ],
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
                              vertical: 20, horizontal: 30),
                        ),
                        child: const Icon(Icons.people),
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
                              vertical: 20, horizontal: 30),
                        ),
                        child: const Icon(Icons.person),
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
