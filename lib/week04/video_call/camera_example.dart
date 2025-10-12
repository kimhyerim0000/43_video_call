import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _ cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CameraApp());
}