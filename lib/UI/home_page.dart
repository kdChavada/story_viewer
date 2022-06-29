import 'package:flutter/material.dart';
import 'package:whatsapp_lite/UI/camra.dart';
import 'package:whatsapp_lite/UI/chat_List.dart';
import 'package:whatsapp_lite/UI/settings.dart';
import 'package:whatsapp_lite/UI/status.dart';

import '../helper/constant.dart';
import 'calls_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> index = ValueNotifier(1);

  ValueNotifier<bool> searchField = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      body: DefaultTabController(
        animationDuration: const Duration(seconds: 1),
        initialIndex: 1,
        length: 4,
        child: ValueListenableBuilder(
            valueListenable: searchField,
            builder: (
              context,
              k,
              d,
            ) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: kGreenColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      searchField.value == true
                          ? Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      searchField.value = false;
                                      searchField.notifyListeners();
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 30,
                                      color: kWhiteColor,
                                    )),
                                SizedBox(
                                  width: w * 0.45,
                                  child: TextField(
                                    autofocus: true,
                                    onChanged: (val) {},
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: kWhiteColor),
                                    decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const Text('WhatsApp Lite'),
                      searchField.value == true
                          ? SizedBox()
                          : Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    searchField.value = true;
                                    searchField.notifyListeners();
                                  },
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                ValueListenableBuilder(
                                    valueListenable: index,
                                    builder: (context, v, c) {
                                      return index.value == 1
                                          ? PopupMenuButton(
                                              itemBuilder:
                                                  (BuildContext context) =>
                                                      <PopupMenuEntry>[
                                                const PopupMenuItem(
                                                  child: Text('New group'),
                                                ),
                                                const PopupMenuItem(
                                                  child: Text('New broadcast'),
                                                ),
                                                const PopupMenuItem(
                                                  child: Text('Linked Devices'),
                                                ),
                                                const PopupMenuItem(
                                                  child:
                                                      Text('Starred Message'),
                                                ),
                                                const PopupMenuItem(
                                                  child: Text('Payment'),
                                                ),
                                                PopupMenuItem(
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return const Setting();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: const Text(
                                                          'Setting')),
                                                ),
                                              ],
                                            )
                                          : index.value == 2
                                              ? PopupMenuButton(
                                                  itemBuilder:
                                                      (BuildContext context) =>
                                                          <PopupMenuEntry>[
                                                    PopupMenuItem(
                                                      onTap: () {},
                                                      child: const Text(
                                                          'Status Privacy'),
                                                    ),
                                                    const PopupMenuItem(
                                                      child: Text('Settings'),
                                                    ),
                                                  ],
                                                )
                                              : index.value == 3
                                                  ? PopupMenuButton(
                                                      itemBuilder: (BuildContext
                                                              context) =>
                                                          <PopupMenuEntry>[
                                                        PopupMenuItem(
                                                          onTap: () {},
                                                          child: const Text(
                                                              'Clear call log'),
                                                        ),
                                                        const PopupMenuItem(
                                                          child:
                                                              Text('Settings'),
                                                        ),
                                                      ],
                                                    )
                                                  : const SizedBox();
                                    })
                              ],
                            ),
                    ],
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 3.0,
                    onTap: (val) {
                      index.value = val;
                      index.notifyListeners();
                      print(index);
                    },
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.camera_alt),
                      ),
                      Tab(text: "CHATS"),
                      Tab(text: "STATUS"),
                      Tab(text: "CALLS"),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Camera(),
                    ChatList(),
                    Status(),
                    CallsPage(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
