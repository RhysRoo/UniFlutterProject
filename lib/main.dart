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
      backgroundColor: Color(0xffd7b516),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: const Alignment(0.0, 0.0),
                child: MaterialButton(
                  onPressed: () {
                    buttonHandler();
                  },
                  color: const Color(0xff019fa1),
                  elevation: 0,
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
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, -0.3),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                    color: Color(0xffffffff),
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
