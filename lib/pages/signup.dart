import 'package:flutter/material.dart';
import 'package:untitled1/database/firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
//firestore

final FirestoreService firestoreService = FirestoreService();

class _SignupState extends State<Signup> {
  // Controllers should be final if they are in a StatelessWidget
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _dayEntryFieldController =
      TextEditingController();

  final TextEditingController _monthEntryFieldController =
      TextEditingController();

  final TextEditingController _yearEntryFieldController =
      TextEditingController();

  final TextEditingController textController = TextEditingController();

  final TextEditingController _fNameEntryFieldController =
      TextEditingController();

  final TextEditingController _lNameEntryFieldController =
      TextEditingController();

  final TextEditingController _usernameEntryFieldController =
      TextEditingController();

  // void openUsernameBox() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: TextField(
  //         controller: textController,
  //       ),
  //       actions: [
  //         ElevatedButton(
  //             onPressed: (() {
  //               firestoreService.addUsername(textController.text);
  //               textController.clear();
  //               Navigator.pop(context);
  //             }),
  //             child: const Text('Add Username'))
  //       ],
  //     ),
  //   );
  // }

  void openUserDataBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          alignment: Alignment(0.0, 0.2),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            children: [
              TextField(
                controller: _usernameEntryFieldController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextField(
                controller: _fNameEntryFieldController,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              TextField(
                controller: _lNameEntryFieldController,
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              TextField(
                controller: _dayEntryFieldController,
                decoration: InputDecoration(hintText: 'Day of birth'),
              ),
              TextField(
                controller: _monthEntryFieldController,
                decoration: InputDecoration(hintText: 'Month of birth'),
              ),
              TextField(
                controller: _yearEntryFieldController,
                decoration: InputDecoration(hintText: 'Year of birth'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: (() {
              firestoreService.addUser(
                  _usernameEntryFieldController.text,
                  _fNameEntryFieldController.text,
                  _lNameEntryFieldController.text,
                  int.parse(_dayEntryFieldController.text),
                  int.parse(_monthEntryFieldController.text),
                  int.parse(_yearEntryFieldController.text),
                  _emailController.text,
                  _passwordController.text);

              _usernameEntryFieldController.clear();
              _fNameEntryFieldController.clear();
              _lNameEntryFieldController.clear();
              _dayEntryFieldController.clear();
              _monthEntryFieldController.clear();
              _yearEntryFieldController.clear();
              _emailController.clear();
              _passwordController.clear();

              Navigator.pop(context);
            }),
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            const Align(
              alignment: Alignment(0.0, -0.85),
              child: Text(
                'Welcome to Social App\n     Registration Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0.0, -0.7),
              child: Text(
                '     Before we start, let\'s get you seen. \n below could you upload a profile picture\n                              for us :)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0.0, -0.5),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 80,
              ),
            ),
            const Column(children: [
              SizedBox(height: 300),
              Align(
                alignment: Alignment(-0.75, 0.0),
                child: Text(
                  'Username:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
            Stack(
              alignment: const Alignment(0.0, 0.0),
              children: [
                Align(
                  alignment: const Alignment(0.0, 0.3),
                  child: IconButton(
                    onPressed: openUserDataBox,
                    icon: const Icon(Icons.ac_unit_sharp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
