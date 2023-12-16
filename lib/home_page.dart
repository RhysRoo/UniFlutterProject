import 'package:flutter/material.dart';
import 'user_post.dart';
import 'settings.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              const Align(
                alignment: Alignment(0.0, -0.83),
                child: Text('Social Media Application'),
              ),
              Align(
                alignment: const Alignment(0.0, -0.1),
                child: Container(
                  width: 410,
                  height: 650,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50), right: Radius.circular(50)),
                  ),
                  child: Stack(children: [
                    Align(
                      alignment: const Alignment(0.0, 0.0),
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 6,
                        crossAxisCount: 3,
                        children: [
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/1.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/2.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/3.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/4.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/5.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/6.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/7.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/8.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              userPostButtonHandler(context);
                            }),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/9.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/10.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/11.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              userPostButtonHandler(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/12.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              userPostButtonHandler(context);
                            }),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/13.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              userPostButtonHandler(context);
                            }),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/14.jpeg'),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              userPostButtonHandler(context);
                            }),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/15.jpeg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
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
