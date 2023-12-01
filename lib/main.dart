import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'node.dart';

List<Node> decisionMap = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //POPULATE LIST CODE
  String csv = "assets/decision_map.csv";
  String fileData = await rootBundle.loadString(csv);
  print(fileData); //test data is loaded.

  List<String> rows = fileData.split("\n");
  for (int i = 0; i < rows.length; i++) {
    //selects an item from row and places
    String row = rows[i];
    List<String> itemInRow = row.split(",");

    Node node =
        Node(int.parse(itemInRow[0]), int.parse(itemInRow[1]), itemInRow[2]);

    decisionMap.add(node);
  }

  runApp(
    const MaterialApp(
      home: MyFlutterApp(),
    ),
  );
}

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<MyFlutterApp> {
  //WRITE VARIABLES AND EVENT HANDLERS HERE
  late int iD;
  late int nextID;
  String description = '';

  @override
  void initState() {
    super.initState();
    //PLACE CODE HERE TO INITALISE SERVER OBJECTS

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //PLACE CODE HERE YOU WANT TO EXECUTE IMMEDIATELY AFTER
      //THE UI IS BUILT
      setState(() {
        Node current = decisionMap.first;
        if (current != null) {
          iD = current.iD;
          nextID = current.nextID;
          description = current.description;
        }
      });
    });
  }

  void buttonHandler() {
    setState(() {
      for (Node nextNode in decisionMap) {
        if (nextNode.iD == nextID) {
          iD = nextNode.iD;
          nextID = nextNode.nextID;
          description = nextNode.description;
          break;
        }
      }
    });
  }

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
                  height: 672,
                  decoration: const BoxDecoration(color: Colors.black12),
                  child: Stack(children: [
                    Align(
                        alignment: const Alignment(0.0, 0.0),
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(10),
                          crossAxisSpacing: 6,
                          crossAxisCount: 3,
                          children: const [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/1.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/2.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/3.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/4.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/5.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/6.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/7.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/8.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/9.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/10.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/11.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/12.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/13.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/14.jpeg'),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile_pics/15.jpeg'),
                            ),
                          ],
                        )),
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
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.7, -0.2),
                        child: ElevatedButton(
                          onPressed: () {
                            buttonHandler();
                          },
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
            ],
          ),
        ),
      ),
    ); //end of scaffold
  }
}
