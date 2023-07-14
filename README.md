# call_integrate

[![pub package](https://img.shields.io/pub/v/url_launcher.svg)](https://pub.dev/packages/url_launcher)

A Flutter plugin for calling.

|             | Android | iOS   |
|-------------|---------|-------|
| **Support** | SDK 16+ | 11.0+ |

## Usage

To use this plugin, add `call_integrate` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

### Example

<?code-excerpt "lib/basic.dart (basic-example)"?>
```dart
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
```

See the example app for more complex examples.

## Configuration

### Android

We need to add the permission to use Call Feature.
In the android/app/src/main/AndroidManifest.xml let’s add:
```xml
 <uses-feature
        android:name="android.hardware.telephony"
        android:required="false" />
    <uses-permission android:name="android.permission.CALL_PHONE"/>
<application

```

Call Feature are only supported if there are apps installed on the device that can
support them. For example, iOS simulators don't have a default email or phone
apps installed, so can't open `tel:` links.

