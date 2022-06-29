import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../helper/constant.dart';

class QRCode extends StatefulWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    double h =  MediaQuery.of(context).size.height;
    double w =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kGreenColor,
        title: const Text("Join"),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: h*0.3,
              width: w*0.5,
              child: QrImage(
                data: "",
                size: 300,
               // embeddedImage: AssetImage('images/logo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                    size: const Size(80,80)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
