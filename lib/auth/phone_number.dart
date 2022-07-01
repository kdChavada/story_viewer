import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp_lite/auth/otp_verification.dart';
import 'package:whatsapp_lite/helper/constant.dart';
import 'package:whatsapp_lite/helper/country_code.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController phoneNumberCode = TextEditingController();

  ValueNotifier<String> countryName = ValueNotifier("");

  @override
  void dispose() {
    phoneNumber.dispose();
    phoneNumberCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: h * 0.14,
            width: w,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.2,
                      ),
                      SizedBox(
                        child: Text(
                          "Enter Your Phone number",
                          style: TextStyle(
                              color: kGreenColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        child: Text('Help'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //------------- whats my number
              Column(
                children: [
                  const Text(
                      "WhatsApp will need to  verify youre Phone Number"),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "whats`s my number?",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: countryName,
                      builder: (context, k, d) {
                        return Text(countryName.value);
                      }),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.2,
                      child: TextField(
                        onChanged: (value) {
                          if (value == "") {
                            countryName.value = "";
                            countryName.notifyListeners();
                          } else {
                            for (int i = 0; i < countryData.length; i++) {
                              if (countryData[i]['Code'] == value) {
                                countryName.value = countryData[i]['Country'];
                                countryName.notifyListeners();

                                print(countryData[i]['Country']);
                              }
                            }
                          }
                        },
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberCode,
                        maxLength: 3,
                        decoration: const InputDecoration(
                            counterText: "",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            hintText: "+91"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: w * 0.66,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumber,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          counterText: "",
                          hintText: "Mobile Number",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              if (phoneNumberCode.text == "") {
                Fluttertoast.showToast(
                    msg: "Please Enter Country Code",
                    backgroundColor: Colors.redAccent,
                    gravity: ToastGravity.TOP_LEFT);
              } else if (phoneNumber.text == "") {
                Fluttertoast.showToast(
                    msg: "Please Enter Mobile-Number",
                    backgroundColor: Colors.redAccent,
                    gravity: ToastGravity.TOP_LEFT);
              } else if (phoneNumber.text.length != 10) {
                Fluttertoast.showToast(
                    msg: "Please Enter 10 Digit Mobile Number",
                    backgroundColor: Colors.redAccent,
                    gravity: ToastGravity.TOP_LEFT);
              } else {
                Fluttertoast.showToast(
                    msg: "OTP Send Successfully",
                    backgroundColor: Colors.green,
                    gravity: ToastGravity.TOP_LEFT);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpVerification(mobileNumber: '${phoneNumberCode.text} ${phoneNumber.text}',),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              width: w * 0.5,
              decoration: BoxDecoration(
                  color: kGreenColor, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Send Otp",
                  style: TextStyle(color: kWhiteColor, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 07,
          ),
        ],
      ),
    );
  }
}
