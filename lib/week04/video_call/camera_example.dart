import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  // Flutter 앱이 실행될 준비가 됐는지 확인
  WidgetsFlutterBinding.ensureInitialized();

  // 핸드폰에 있는 카메라들 가져오기
  _cameras = await availableCameras();
  runApp(const CameraApp());
}

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) :super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  // 카메라를 제어할 수 있는 컨트롤러 선언
  late CameraController controller;
  
  @override
  void initState() {
    super.initState();

    initializeCamera();
  }
  initializeCamera() async {
    try{

      controller = CameraController(_cameras[0], ResolutionPreset.max);

      await controller.initialize();

      setState(() {});
    } catch (e) {
      
      if (e is CameraException) {
        switch(e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    }
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }
}