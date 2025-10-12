import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  Future<bool> init() async { // 권한 관련 작업 모두 실행
    final resp = await [Permission.camera, Permission.microphone].requres();

    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];

    if(cameraPermission != PermissionStatus.granted ||
        micPermission != PermissionStatus.granted) {
          throw '카메라 또는 마이크 권한이 없습니다.';
        }
        return true;
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