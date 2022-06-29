import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../helper/constant.dart';
import 'edit_text.dart';

class TextStory extends StatefulWidget {
  const TextStory({Key? key}) : super(key: key);

  @override
  State<TextStory> createState() => _TextStoryState();
}

class _TextStoryState extends State<TextStory> {
  TextEditingController myTextStatus = TextEditingController();

  ValueNotifier<bool> saveButtonShowHide = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder(
              valueListenable: saveButtonShowHide,
              builder: (context, k, d) {
                return saveButtonShowHide.value == true
                    ? Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>   TextEditStory(text: myTextStatus.text,)));
                            },
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(color: kWhiteColor, fontSize: 18),
                            )),
                      )
                    : SizedBox();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 242,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: Border.all(color: Color(0xffd1d1d7), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: TextField(
                    autofocus: true,
                    maxLines: null,
                    style: const TextStyle(
                        color: Color(0x99000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                        fontStyle: FontStyle.normal,
                        fontSize: 40.0),
                    controller: myTextStatus,
                    cursorHeight: 40,
                    cursorColor: kGreenColor,
                    onChanged: (value) {
                      if (value == "") {
                        saveButtonShowHide.value = false;
                        saveButtonShowHide.notifyListeners();
                      } else {
                        saveButtonShowHide.value = true;
                        saveButtonShowHide.notifyListeners();
                      }
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
