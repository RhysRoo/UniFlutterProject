import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'node.dart';
import 'login.dart';

// List<Node> decisionMap = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //POPULATE LIST CODE
  // String csv = "assets/decision_map.csv";
  // String fileData = await rootBundle.loadString(csv);
  // print(fileData); //test data is loaded.

  // List<String> rows = fileData.split("\n");
  // for (int i = 0; i < rows.length; i++) {
  //   //selects an item from row and places
  //   String row = rows[i];
  //   List<String> itemInRow = row.split(",");

  //   Node node =
  //       Node(int.parse(itemInRow[0]), int.parse(itemInRow[1]), itemInRow[2]);

  //   // decisionMap.add(node);
  // }

  runApp(
    const MaterialApp(
      home: Login(),
    ),
  );
}
