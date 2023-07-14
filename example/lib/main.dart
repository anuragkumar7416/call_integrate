import 'package:flutter/material.dart';
import 'dart:async';
import 'package:call_integrate/call_integrate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _callIntegratePlugin = CallIntegrate();

  @override
  void initState() {
    super.initState();

  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> phoneCall(String phoneNo) async {
    bool callStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

      callStatus =
          await _callIntegratePlugin.makePhoneCall(phoneNo) ?? false;


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              phoneCall('1234567890');

            },
            child: const Text('Call'),
          ),
        ),
      ),
    );
  }
}
