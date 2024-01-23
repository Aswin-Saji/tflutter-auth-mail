import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 74, 34),
        title: Text("Home Screen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),
    body: Column(
      
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Center(child: Text("OTP verification successfully")),
    ],),
    floatingActionButton:FloatingActionButton(onPressed: (){},child: Icon(Icons.add,color: Colors.white,),backgroundColor: const Color.fromARGB(255, 33, 75, 34),) ,
    );
  }
}