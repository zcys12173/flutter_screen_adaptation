import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_screen_adaptation/flutter_screen_adaptation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenAdaptation.init(800, 600);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(width: 400.wdp, height:300.hdp,color: Colors.green,),
        ),
      ),
    );
  }
}
