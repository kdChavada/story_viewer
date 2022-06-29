import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  String nameOfUser;

  ChatScreen({Key? key, required this.nameOfUser}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ValueNotifier<bool> showHideButton = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nameOfUser),
        actions: [
          PopupMenuButton(   itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              child: Text('View Content'),
            ),
            const PopupMenuItem(
              child: Text('Report'),
            ),
            const PopupMenuItem(
              child: Text('Block'),
            ),
            const PopupMenuItem(
              child: Text('Search'),
            ),
            const PopupMenuItem(
              child: Text('Mute Notification'),
            ),
            const PopupMenuItem(
              child: Text('Wallpaper'),
            ),
            const PopupMenuItem(
              child: Text('Clear Chat'),
            ),
            const PopupMenuItem(
              child: Text('Export Chat'),
            ),
          ]),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(30),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Hii.."),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Hii.."),
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 0.0,
            color: Colors.grey,
            thickness: 2,
          ),
          SizedBox(
              height: 50,
              width: w,
              child: TextField(
                onChanged: (val) {
                  if (val == "") {
                    showHideButton.value = false;
                    showHideButton.notifyListeners();
                  } else {
                    showHideButton.value = true;
                    showHideButton.notifyListeners();
                  }
                },
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: ValueListenableBuilder(
                    valueListenable: showHideButton,
                    builder: (context, v, c) {
                      return showHideButton.value == true
                          ? GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.send,
                                size: 25,
                                color: Colors.blue,
                              ))
                          : const Icon(
                              Icons.send,
                              size: 25,
                              color: Colors.grey,
                            );
                    },
                  ),
                  hintText: "Enter Message",
                  contentPadding:
                     const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }
}
