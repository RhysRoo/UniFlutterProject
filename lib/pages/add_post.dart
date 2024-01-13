import 'package:flutter/material.dart';
import 'package:untitled1/pages/test_home.dart';
import 'user_post.dart';
import 'user_settings.dart';

void userPostButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UserPost()),
  );
}

void settingsButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UserSettings()),
  );
}

// ignore: non_constant_identifier_names
void AddPostButtonHandler(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddPost()),
  );
}

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller used to see what user is typing
    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topLeft, children: [
            Container(
              alignment: const Alignment(-0.9, -0.82),
              child: BackButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TestHomePage()),
                  );
                },
              ),
            ),
            const Align(
              alignment: Alignment(0.0, -0.8),
              child: Text(
                'Create Post',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Flexible(
                fit: FlexFit.loose,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 180,
                          width: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          alignment: const Alignment(0.0, 0.0),
                          child: const Text("Profile"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            alignment: const Alignment(0.0, 0.0),
                            child: TextField(
                              controller: textController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    textController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                              ),
                              maxLines: null,
                              minLines: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey[500]),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TestHomePage()),
                            );
                          },
                          child: const Text(
                            'Add Post',
                            style: TextStyle(
                                color: Colors.black), // Change the color here
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
