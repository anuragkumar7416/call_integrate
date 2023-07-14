import 'dart:async';
import 'package:call_integrate/call_integrate.dart';
import 'package:flutter/material.dart';

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

  Future<void> phoneCall(String phoneNo) async {
    await _callIntegratePlugin.makePhoneCall(phoneNo);
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
            onPressed: () {
              phoneCall('1234567890');
            },
            child: const Text('Call'),
          ),
        ),
      ),
    );
  }
}
