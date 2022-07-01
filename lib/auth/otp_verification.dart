import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp_lite/UI/home_page.dart';
import 'package:whatsapp_lite/helper/constant.dart';

class OtpVerification extends StatefulWidget {
  String mobileNumber;

  OtpVerification({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController otpNumberController = TextEditingController();

  late Timer callMeTimer;

  late Timer timerSMSTimer;

  int callSendTimerMaxSecond = 60;

  int reSendSMSTimerMaxSeconds = 60;

  int currentSecondsSMS = 0;
  int currentSecondsCall = 0;

  String get timerText => ((reSendSMSTimerMaxSeconds - currentSecondsSMS) % 60)
      .toString()
      .padLeft(0, '');

  String get callTimerText =>
      ((callSendTimerMaxSecond - currentSecondsCall) % 60)
          .toString()
          .padLeft(0, '');

  void callTimer() {
    const oneSec = Duration(seconds: 1);
    callMeTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (callSendTimerMaxSecond == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            callSendTimerMaxSecond--;
          });
        }
      },
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timerSMSTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (reSendSMSTimerMaxSeconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            reSendSMSTimerMaxSeconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    otpNumberController.dispose();
    callMeTimer.cancel();
    timerSMSTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: h * 0.14,
            width: w,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              textScaleFactor: 0.85,
              text: TextSpan(children: [
                TextSpan(
                    text: "Waiting to automatically detected an SMS send to ",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: kBlackColor,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                  text: "+${widget.mobileNumber} ",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: kBlackColor,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                TextSpan(
                    text: "Wrong Number?",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.blue,
                      fontSize: 19,
                      fontStyle: FontStyle.normal,
                    )),
              ]),
            ),
          ),

          //------------ Otp Number -----------
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: kGreenColor,
                  inactiveColor: Colors.grey),
              animationDuration: const Duration(milliseconds: 300),
              controller: otpNumberController,
              onCompleted: (v) {
                if (v == "123456") {
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  Fluttertoast.showToast(msg: "Please Enter Valid Otp Number");
                }
              },
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return true;
              },
              appContext: context,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              height: 0.0,
              color: kGreenColor,
              thickness: 1.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Enter 6-digit code"),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                reSendSMSTimerMaxSeconds == 0
                    ? GestureDetector(
                        onTap: () {
                          reSendSMSTimerMaxSeconds = 60;
                          startTimer();
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.sms,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Resend SMS",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        children: const [
                          Icon(
                            Icons.sms,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Resend SMS",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                reSendSMSTimerMaxSeconds == 0 ? Container() : Text(timerText),
              ],
            ),
          ),

          const Divider(
            height: 0.0,
            thickness: 1,
            indent: 15.0,
            endIndent: 15.0,
            color: Colors.grey,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                callSendTimerMaxSecond == 0
                    ? GestureDetector(
                        onTap: () {
                          callSendTimerMaxSecond = 60;
                          callTimer();
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Call Me",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        children: const [
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Call Me",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                callSendTimerMaxSecond == 0 ? Container() : Text(callTimerText),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
