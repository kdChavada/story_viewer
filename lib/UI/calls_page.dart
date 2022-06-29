import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constant.dart';
import '../helper/data_base.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView.builder(
            itemCount: chatDataList.length,
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, k) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MoreStories(
                              //       nameOfUser:
                              //       '${chatDataList[k]['display_name']}',
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:kGreenColor, width: 3),
                                  shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  '${chatDataList[k]['display_img']}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${chatDataList[k]['display_name']}"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${chatDataList[k]['datetime']}"),
                            ],
                          )
                        ],
                        ),

                        Icon(CupertinoIcons.video_camera_solid,size: 30,color: kGreenColor,),





                      ],
                    ),

                  ],
                ),
              );
            }),
      ),
    );
  }
}
