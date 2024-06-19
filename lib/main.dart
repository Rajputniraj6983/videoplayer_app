import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/Music_provider.dart';
import 'view/screen/Homepage.dart';
import 'view/screen/splashscreen.dart';


void main()
{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MusicProvider(),)
  ],builder: (context, child) => MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),

    );
  }
}
