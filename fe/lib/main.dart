import 'package:camera/camera.dart';
import 'package:fe/constants.dart';
import 'package:fe/routes.dart';
import 'package:fe/src/services/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 사용 가능한 카메라 목록을 가져옵니다.#
  final cameras = await availableCameras();
  print("cameras : ");

  // 첫 번째 카메라를 선택합니다.
  final firstCamera = cameras.first;
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => CameraProvider()..setCamera(firstCamera)),
      ],
      child: MaterialApp(
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.5)),
            child: child!,
          );
        },
        theme: ThemeData(
          fontFamily: "SDchild",
        ),
        routes: routes,
      ),
    ),
  );
}
