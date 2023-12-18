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
                  alignment: const Alignment(0.0, -0.5),
                  child: Container(
                    width: 410,
                    height: 670,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.topCenter,
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
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const UserPost(),
                                        transitionDuration:
                                            const Duration(milliseconds: 300),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
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
                        ]),
                      ),
                    ),
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
                                vertical: 20, horizontal: 30),
                          ),
                          child: const Icon(Icons.people),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.0, -0.3),
                        child: ElevatedButton(
                          onPressed: () {
                            AddPostButtonHandler(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                          ),
                          child: const Icon(
                            Icons.add_box,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.7, -0.2),
                        child: ElevatedButton(
                          onPressed: () {
                            settingsButtonHandler(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                          ),
                          child: const Icon(Icons.settings),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ); //end of scaffold
  }
}
