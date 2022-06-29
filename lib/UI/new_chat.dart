import 'package:flutter/material.dart';

import '../helper/constant.dart';
import '../helper/data_base.dart';

class NewChatContact extends StatefulWidget {
  const NewChatContact({Key? key}) : super(key: key);

  @override
  State<NewChatContact> createState() => _NewChatContactState();
}

class _NewChatContactState extends State<NewChatContact> {
  ValueNotifier<bool> searchField = ValueNotifier(false);

  TextEditingController searchUser = TextEditingController();

  ValueNotifier<List<Map<String, dynamic>>> searchUserData = ValueNotifier([]);

  void searchUserDataList(String val) {
    searchUserData.value = [];
    // print(val);
    for (int i = 0; i < chatDataList.length; i++) {
      String name = chatDataList[i]['display_name'];
      if (name.contains(val)) {
        searchUserData.value.add(chatDataList[i]);
      } else {}
    }
  }

  @override
  void initState() {
    searchUserDataList('');
    super.initState();
  }

  @override
  void dispose() {
    searchUser.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchField,
        builder: (context, k, d) {
          return Scaffold(
            appBar: searchField.value == true
                ? AppBar(
                    backgroundColor: kGreenColor,
                    title: TextField(
                      autofocus: true,
                      onChanged: (val) {
                        searchUserDataList(val.toLowerCase().toString());
                      },
                      cursorColor: Colors.white,
                      controller: searchUser,
                      style: TextStyle(color: kWhiteColor),
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    leading: GestureDetector(
                        onTap: () {
                          searchField.value = false;
                          searchField.notifyListeners();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: kWhiteColor,
                        )),
                  )
                : AppBar(
                    backgroundColor: kGreenColor,
                    title: const Text("Select Contact"),
                    actions: [
                      GestureDetector(
                          onTap: () {
                            searchField.value = true;
                            searchField.notifyListeners();
                          },
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: kWhiteColor,
                          )),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          const PopupMenuItem(
                            child: Text('Invite a Friend'),
                          ),
                          const PopupMenuItem(
                            child: Text('Contacts'),
                          ),
                          const PopupMenuItem(
                            child: Text('Refresh'),
                          ),
                          const PopupMenuItem(
                            child: Text('Help'),
                          ),
                        ],
                      ),
                    ],
                  ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: kLightGreenColor,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Icon(Icons.group_rounded,
                                    size: 30, color: kWhiteColor),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("New Group"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: kLightGreenColor,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(Icons.group_add_rounded,
                                        size: 30, color: kWhiteColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text("New Contact "),
                              ],
                            ),
                            Icon(
                              Icons.qr_code_outlined,
                              color: kLightGreenColor,
                              size: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      itemCount: searchUserData.value.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, k) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kGreenColor, width: 3),
                                          shape: BoxShape.circle),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          '${searchUserData.value[k]['display_img']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${searchUserData.value[k]['display_name']}"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "${searchUserData.value[k]['message']}"),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}
