import 'package:flutter/material.dart';
import 'package:whatsapp_lite/UI/new_chat.dart';
import '../helper/constant.dart';
import '../helper/data_base.dart';
import 'chat_screen.dart';


class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: chatDataList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                    nameOfUser:
                                        "${chatDataList[i]['display_name']}")));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: w,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kGreenColor, width: 3),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      "${chatDataList[i]['display_img']}",
                                      fit: BoxFit.cover,
                                      height: 60.0,
                                      width: 60.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                        child: Text(
                                            "${chatDataList[i]['display_name']}")),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("${chatDataList[i]['message']}"),
                                  ],
                                ),
                              ],
                            ),
                            Text("${chatDataList[i]['datetime']}"),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewChatContact()));

        },
        backgroundColor: kGreenColor,
        child: const Icon(Icons.message),
      ),
    );
  }
}
