import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/otp.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 74, 34),
        title: Text(
          "Phone OTP verification",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.pinimg.com/236x/60/74/9b/60749be57fdfa6763f6adc2ef34a782f.jpg",),fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter the phone number"),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phonenumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.3),
                    filled: true,
                    hintText: "Phone number"),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
  onPressed: () async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {
          // Handle verification completed
        },
        verificationFailed: (FirebaseAuthException ex) {
          // Handle verification failed
          print('Verification Failed: ${ex.message}');
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          // Navigate to OTP screen with verification ID
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout
        },
        phoneNumber: phonenumberController.text.toString(),
      );
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    }
  },
  child: Text("Enter"),
),

                // child: ElevatedButton(
                //     onPressed: () async {
                      
                //       await FirebaseAuth.instance.verifyPhoneNumber(
                //           verificationCompleted:
                //               (PhoneAuthCredential credential) {},
                //           verificationFailed:
                //               (FirebaseAuthException ex) {},
                //           codeSent: (String verificationId,
                //               int? forceResendingToken) {
                //                    Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Otp(verificationId: verificationId,)));
                //               },
                //           codeAutoRetrievalTimeout: (String verificationId) {},
                //           phoneNumber: phonenumberController.text.toString());
                   
                //     },
                //     child: Text(
                //       "Enter",
                //     )),
                
              ),
             
            ],
          ),
        ),
      ),
      
      // floatingActionButton: FloatingActionButton(onPressed: (){

      // },
      // child: Icon(Icons.add),
      // ),
    );
  }
}
