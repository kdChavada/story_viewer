import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_lite/auth/phone_number.dart';
import 'package:whatsapp_lite/helper/constant.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
          Text(
            "Welcome To Whatsapp Lite",
            style: TextStyle(
                color: kGreenColor, fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: h * 0.06,
          ),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: kGreenColor,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(
                  'assets/images/home.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: h * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 0.85,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Read our ",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: kBlackColor,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                    text: "Privacy Policy.",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      color: Color(0xff1a9ce3),
                      fontSize: 19,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextSpan(
                      text: "Tap \"Agree and continue\" to ",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: kBlackColor,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                      text: "accept the ",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: kBlackColor,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                    text: "Terms of Service.",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      color: Color(0xff1a9ce3),
                      fontSize: 19,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ])),
          ),
          SizedBox(
            height: h * 0.07,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const PhoneNumber(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              height: 50,
              width: w * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kGreenColor,
              ),
              child: Center(
                child: Text(
                  "AGREE AND CONTINUE",
                  style: TextStyle(color: kWhiteColor, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
