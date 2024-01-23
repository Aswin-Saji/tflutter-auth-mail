import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class Otp extends StatefulWidget {
  String verificationId;
  Otp({super.key, required this.verificationId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 74, 34),
        title: Text(
          "OTP screen",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter the OTP"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.withOpacity(0.3),
                  filled: true,
                  hintText: "OTP"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                         PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: otpController.text.toString());

                      await  FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                           Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const home()));

                        });
                  } catch (ex) {
                   log(ex.toString() as num);
                  }
                 
                },
                child: Text("Enter")),
          ],
        ),
      ),
    );
  }
}
