import 'package:flutter/material.dart';
import 'user_post.dart';
import 'settings.dart';
import 'add_post.dart';

void userPostButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UserPost()),
  );
}

void settingsButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Settings()),
  );
}

// ignore: non_constant_identifier_names
void AddPostButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddPost()),
  );
}

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  State<TestHomePage> createState() => _HomePageState();
}

List<String> imagePaths = [
  'assets/images/profile_pics/1.jpeg',
  'assets/images/profile_pics/2.jpeg',
  'assets/images/profile_pics/3.jpeg',
  'assets/images/profile_pics/4.jpeg',
  'assets/images/profile_pics/5.jpeg',
  'assets/images/profile_pics/6.jpeg',
  'assets/images/profile_pics/7.jpeg',
  'assets/images/profile_pics/8.jpeg',
  'assets/images/profile_pics/9.jpeg',
  'assets/images/profile_pics/10.jpeg',
  'assets/images/profile_pics/11.jpeg',
  'assets/images/profile_pics/12.jpeg',
  'assets/images/profile_pics/13.jpeg',
  'assets/images/profile_pics/14.jpeg',
  'assets/images/profile_pics/15.jpeg',
];

class _HomePageState extends State<TestHomePage> {
  late int iD;
  late int nextID;
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              SafeArea(
                child: Align(
                  alignment: const Alignment(0.0, -0.6),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.83,
                    height: MediaQuery.of(context).size.height * 0.72,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(80),
                          right: Radius.circular(80)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(115),
                          right: Radius.circular(115)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Expanded(
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imagePaths.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 13,
                                  mainAxisSpacing: 13,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              const UserPost(),
                                          transitionDuration:
                                              const Duration(milliseconds: 250),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            animation = CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.bounceInOut,
                                            );
                                            return ScaleTransition(
                                              scale: animation,
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(imagePaths[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
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
                              AddPostButtonHandler(context);
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
            ],
          ),
        ),
      ),
    );
  }
}
