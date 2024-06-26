import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/database/firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/pages/user_settings.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

//firestore
void LoginButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

Future<void> uploadUserImage(File imageFile, String userId) async {
  try {
    // Create a reference to the location you want to upload to in Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('user_images/$userId/profile_picture');

    // Upload the file to Firebase Storage
    UploadTask uploadTask = storageReference.putFile(imageFile);

    // Get the download URL
    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = (await downloadUrl.ref.getDownloadURL());

    // Save the download URL to Firestore
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'imageUrl': url,
    });
  } catch (e) {
    print('An error occurred while uploading the image: $e');
    // You can handle the error here, for example by showing a message to the user
  }
}

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
    File _imageFile;

    void log(String message) {
      // In a real-world application, replace this with your logging framework
      print(message);
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          alignment: Alignment(0.0, 0.2),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
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
              ElevatedButton(
                onPressed: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    _imageFile = File(pickedFile.path);
                  }
                },
                child: const Text('Pick Image'),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: (() async {
              try {
                int day = int.parse(_dayEntryFieldController.text);
                int month = int.parse(_monthEntryFieldController.text);
                int year = int.parse(_yearEntryFieldController.text);

                if (_usernameEntryFieldController.text.isEmpty ||
                    _fNameEntryFieldController.text.isEmpty ||
                    _lNameEntryFieldController.text.isEmpty ||
                    _dayEntryFieldController.text.isEmpty ||
                    _monthEntryFieldController.text.isEmpty ||
                    _yearEntryFieldController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  throw Exception('All fields must be filled');
                }

                if (day < 1 || day > 31) {
                  log('Day must be between 1 and 31');
                  // Handle error
                  throw Exception('Day must be between 1 and 31');
                }

                if (month < 1 || month > 12) {
                  log('Month must be between 1 and 12');
                  // Handle error
                  throw Exception('Month must be between 1 and 12');
                }

                if (year < 1000 || year > 9999) {
                  log('Year must be between 1000 and 9999');
                  // Handle error
                  throw Exception('Year must be between 1000 and 9999');
                }

                String username = _usernameEntryFieldController.text;
                if (username.length < 3 || username.length > 12) {
                  log('username error');
                  // Handle error
                  throw Exception(
                      'Username must be more than 3 characters long and less than 12 characters');
                }

                String email = _emailController.text;
                if (!email.contains('@') ||
                    (!email.endsWith('.com') && !email.endsWith('.co.uk'))) {
                  log('email error');
                  // Handle error
                  throw Exception(
                      'Email must contain "@" and end with either ".com" or ".co.uk"');
                }

                String password = _passwordController.text;
                if (password.length < 13) {
                  log('Password must be at least 13 characters long');
                  // Handle error
                  throw Exception(
                      'Password must be at least 13 characters long');
                }

                String firstName = _fNameEntryFieldController.text;
                String lastName = _lNameEntryFieldController.text;
                if (firstName.contains(RegExp(r'[^\w\s]')) ||
                    lastName.contains(RegExp(r'[^\w\s]'))) {
                  log('First and last names must not contain special characters');
                  // Handle error
                  throw Exception(
                      'First and last names must not contain special characters');
                }

                UserCredential userCredential =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );

                User? user = userCredential.user;

                if (user != null) {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    _imageFile = File(pickedFile.path);
                    await uploadUserImage(_imageFile, user.uid);
                  }
                }

                firestoreService.addUser(
                  _usernameEntryFieldController.text,
                  _fNameEntryFieldController.text,
                  _lNameEntryFieldController.text,
                  int.parse(_dayEntryFieldController.text),
                  int.parse(_monthEntryFieldController.text),
                  int.parse(_yearEntryFieldController.text),
                  _emailController.text,
                  _passwordController.text,
                );

                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  final File imageFile = File(pickedFile.path);
                  await uploadUserImage(
                      imageFile, _usernameEntryFieldController.text);
                }

                _usernameEntryFieldController.clear();
                _fNameEntryFieldController.clear();
                _lNameEntryFieldController.clear();
                _dayEntryFieldController.clear();
                _monthEntryFieldController.clear();
                _yearEntryFieldController.clear();
                _emailController.clear();
                _passwordController.clear();

                Navigator.of(context).pop;
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('An error occurred'),
                    content: Text('$e'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              }
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
            Align(
              alignment: Alignment(0.0, 0.6),
              child: BackButton(
                onPressed: () => logInButtonHandler(context),
              ),
            ),
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
