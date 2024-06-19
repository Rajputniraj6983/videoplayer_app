
import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/Homepage');
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:  Color(0xff0d0d31),
        body: Container(height:830,width:400,child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Image.asset("assets/logo.image-removebg-preview.png",fit: BoxFit.contain,),
            ),
            SizedBox(height: 300),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text('Music',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                SizedBox(width: 10,),
                CircleAvatar(radius: 2,backgroundColor: Colors.white),
                SizedBox(width: 10),
                Text('Podcast',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(width: 10),
                CircleAvatar(radius: 2,backgroundColor: Colors.white),
                SizedBox(width: 10),
                Text('Gaana Live',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
              ],
            )
          ],
        ),
          
        ),
     ),
    );
  }
}
