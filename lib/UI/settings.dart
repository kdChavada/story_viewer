import 'package:flutter/material.dart';
import 'package:whatsapp_lite/UI/personal_info.dart';
import 'package:whatsapp_lite/UI/qr_code.dart';
import 'package:whatsapp_lite/helper/constant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        centerTitle: true,
        title: const Text("Setting"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PersonalInfo()));
                    },
                    child: Container(
                      width: w * 0.8,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kGreenColor, width: 3),
                                shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://tbcommunity.co.uk/uploads/users/profile/1647714221.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("User Name"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Your Tag Line"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QRCode(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.qr_code_outlined,
                      color: kLightGreenColor,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: kGreenColor,
            height: 0.0,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Transform.rotate(
                            // angle: 90 * math.pi / 180,
                            angle: 1.57,
                            child: const Icon(
                              Icons.key,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Account"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Privacy, Security Change Number"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.message,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Chats"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Theme,wallpapers,chat history"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.notifications,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Notifications"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Message,group & call tones"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.circle_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Storage and data"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Network usage,auto-download"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.help,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Help"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Help center,contact us,privacy policy"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.group_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("Invite a friend"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: const [
                Text("from"),
                Text("9 Brainz"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
