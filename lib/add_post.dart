import 'package:flutter/material.dart';
import 'package:untitled1/test_home.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controller used to see what user is typing
    final _textController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topLeft, children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment(0.3, -0.8),
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
                const SizedBox(
                  width: 5,
                ),
                Container(
                  alignment: const Alignment(0.17, -0.78),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
                          height: 150,
                          width: 150,
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
                            width: 410,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            alignment: const Alignment(0.0, 0.0),
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _textController.clear();
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
                                MaterialStateProperty.all(Colors.blue),
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
