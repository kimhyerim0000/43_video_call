import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_ric_engine.dart';
import 'package:video_call/const/agora.dart';

class CamScreen extends StatefulWidget {
  
  const CamScreen({Key? key}) : super(key: key);

  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine; // 아고라 엔진을 저장할 변수
  int? uid; // 내 ID
  int? otherUid; // 상대방 ID

  Future<bool> init() async { // 권한 관련 작업 모두 실행
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];

    if(cameraPermission != PermissionStatus.granted ||
        micPermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }
    
    if ()
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: FutureBuilder(  // Future값을 기반으로 위젯 렌더링
        future: init(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError){  // Future 실행 후 에러가 있을 때
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if(!snapshot.hasData){  // Future 실행 후 아직 데이터가 없을때(로딩 중)
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(  // 나머지 상황에 권한 있음을 표시
            child: Text('모든 권한이 없습니다.'),
          );
        }
      ),
    );
  }
}