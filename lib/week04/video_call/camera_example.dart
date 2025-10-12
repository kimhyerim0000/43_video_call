import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _ cameras;

Future<void> main() async {
  // Flutter 앱이 실행될 준비가 됐는지 확인
  WidgetsFlutterBinding.ensureInitialized();

  // 핸드폰에 있는 카메라들 가져오기
  _cameras = await availableCameras();
  runApp(const CameraApp());


}