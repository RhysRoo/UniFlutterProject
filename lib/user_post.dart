import 'package:flutter/material.dart';
import 'package:untitled1/home_page.dart';
import 'package:untitled1/settings.dart';

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
                // child: const Text("Comment Section"),
                child: Column(children: [
                  Container(
                    height: 62.5,
                    width: 410,
                    color: Colors.deepOrange,
                  ),
                  Container(
                    height: 62.5,
                    width: 410,
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 62.5,
                    width: 410,
                  ),
                  Container(
                    color: Colors.red,
                    height: 62.5,
                    width: 410,
                  ),
                ]),
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
            Column(
              mainAxisAlignment: MainAxisAlignment
                  .end, // Add this to push your container to the bottom
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadiusGeometry.lerp(
                          const BorderRadius.only(
                              topLeft: Radius.circular(110),
                              topRight: Radius.circular(110)),
                          const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0)),
                          0)!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            settingsButtonHandler(context);
                          },
                          color: const Color(0xFF445352),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.settings,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        MaterialButton(
                          onPressed: (() {
                            (context);
                          }),
                          color: const Color(0xFF445352),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.add,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        MaterialButton(
                          onPressed: (() {
                            userPostButtonHandler(
                                context); // This should probably be userPostButtonHandler instead of settingsButtonHandler
                          }),
                          color: const Color(0xFF445352),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
