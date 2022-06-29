import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_lite/helper/constant.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kGreenColor,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kGreenColor, width: 3),
                          shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://tbcommunity.co.uk/uploads/users/profile/1647714221.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 0.0,
                      right: 10.0,
                      child: Icon(
                        CupertinoIcons.camera_fill,
                        size: 25,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: kGreenColor,
            )
          ],
        ),
      ),
    );
  }
}
