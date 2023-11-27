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
          backID = iD;
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
      backgroundColor: Colors.brown,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: const Alignment(0.0, -0.2),
                child: MaterialButton(
                  onPressed: () {
                    buttonHandler();
                  },
                  color: const Color(0xff019fa1),
                  elevation: 50,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color(0xfffffdfd),
                  height: 40,
                  minWidth: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Click Here",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, -0.6),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.96,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.horizontal()),
                    child: Stack(
                      children: [
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    )),
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
                            Icons.home,
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
