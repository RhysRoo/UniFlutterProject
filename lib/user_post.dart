import 'package:flutter/material.dart';
import 'test_home.dart';
import 'package:untitled1/settings.dart';

void HomePageButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TestHomePage()),
  );
}

class UserPost extends StatelessWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: const Text('Post Information'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topLeft, children: [
            Align(
              alignment: const Alignment(-0.0, -0.9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    //User Picture
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    alignment: const Alignment(0.0, 0.0),
                    child: const Text("User Picture"),
                  ),
                  Container(
                    height: 78,
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      children: [
                        Container(
                          // Username
                          height: 26,
                          width: MediaQuery.of(context).size.width * 0.8,
                          // color: Colors.red,
                          alignment: const Alignment(0.0, 0.0),
                          child: const Text("@ Rhys199"),
                        ),
                        Container(
                          // Followers
                          height: 26,
                          width: 240,
                          // color: Colors.blue,
                          alignment: const Alignment(0.0, 0.0),
                          child: const Text("Followers: 2"),
                        ),
                        Container(
                          // Post likes
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
              //Users Post
              alignment: const Alignment(0.0, -0.3),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: const Alignment(0.0, 0.0),
                child: const Text('Post Message'),
              ),
            ),
            Align(
              //Comment section
              alignment: const Alignment(0.0, 0.5),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: const Alignment(0.0, 0.0),
                child: const Text("Comment Section"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment
                  .end, // Add this to push your container to the bottom
              children: [
                Container(
                  // Bottom navbar
                  height: 100,
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
                        horizontal: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          //Back Button
                          onPressed: () {
                            HomePageButtonHandler(context);
                          },
                          color: const Color(0xFF445352),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        MaterialButton(
                          onPressed: (() {
                            logInButtonHandler(context);
                          }),
                          color: const Color(0xFF445352),
                          child: const Text(
                            'Like',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: (() {
                            userPostButtonHandler(
                                context); // This should probably be userPostButtonHandler instead of settingsButtonHandler
                          }),
                          color: const Color(0xFF445352),
                          child: const Text(
                            'Comment',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
