import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_lite/UI/story_page.dart';
import 'package:whatsapp_lite/UI/text_story.dart';


import '../helper/constant.dart';
import '../helper/data_base.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                 children: [
                   Stack(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             border: Border.all(
                                 color:kGreenColor, width: 3),
                             shape: BoxShape.circle),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(100),
                           child: Image.network(
                             'https://tbcommunity.co.uk/uploads/users/profile/1647714221.jpg',
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                       Positioned(
                           bottom: 0.0,
                           right: 0.0,
                           child: Icon(CupertinoIcons.add_circled_solid,size: 25,color: kWhiteColor,))
                     ],
                   ),
                  const SizedBox(width: 15,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: const [
                       Text("My Status"),
                       SizedBox(height: 5,),
                       Text("Tap to add Status Update"),
                     ],
                   )
                 ],
                ),
              ),
            ),
            Divider(
              height: 0.0,
              color: kGreenColor,
              thickness: 1,
            ),
            ListView.builder(
                itemCount: chatDataList.length,
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, k) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoreStories(
                              nameOfUser:
                              '${chatDataList[k]['display_name']}',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
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

                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {



                Navigator.push(context, MaterialPageRoute(builder: (context)=>   TextStory()));
            },
            backgroundColor: kGreenColor,
            child: const Icon(Icons.edit),
          ),
      const  SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: () {

            },
            backgroundColor: kGreenColor,
            child: const Icon(Icons.camera_alt),
          ),

        ],
      ),
    );
  }
}
