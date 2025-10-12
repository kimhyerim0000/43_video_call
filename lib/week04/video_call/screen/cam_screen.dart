import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].requres();

    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];

    if(cameraPermission != PermissionStatus)
  }
  const CamScreen({Key? key}) : super(key: key);

  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: Center(
        child: Text('Cam Screen'),
      ),
    );
  }
}