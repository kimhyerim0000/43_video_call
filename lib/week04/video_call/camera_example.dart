import 'package:camera/camera.dart';

late List<CameraDescription> _ cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CameraApp());
}