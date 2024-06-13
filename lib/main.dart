import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/profile_setting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_module/lottie_poc.dart';
import 'package:flutter_module/video_poc.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      /**
     * 這邊是單一的 Model，未來如果有多個 Model 可以使用 MultiProvider
     * 也可以直接可改成 Bloc 或其他的
     */
      ChangeNotifierProvider.value(
    value: ProfileSettingModel(),
    child: const MyApp(),
  ));
}

class MemberProfile {
  bool isVip = false;

  static final MemberProfile _memberProfile = MemberProfile._internal();
  final channel =
      const MethodChannel('com.example.flutter_module/member_profile');

  factory MemberProfile() {
    return _memberProfile;
  }

  MemberProfile._internal() {
    debugPrint(
        "Flutter MemberProfile Initialized isVip :${this.isVip} identityHashCode: ${this}");
    channel.setMethodCallHandler((call) async {
      if (call.method == 'update') {
        debugPrint("Flutter MemberProfile ");
        update(true);
      }
    });
  }

  update(bool isVip) {
    this.isVip = isVip;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /**
       * 這邊是設定路由，可以直接在這邊設定，也有套件可以管理
       * 每個頁面一般都是依照樹狀結構來定義 Route
       */
      routes: <String, WidgetBuilder>{
        '/account/profile/setting': (BuildContext context) =>
            const ProfileSetting(),
        '/lottie': (BuildContext context) => const LottiePoc(),
        '/video': (BuildContext context) => const VideoPlayerPOC(),
      },
      home: const LottiePoc(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(),
    ));
  }
}
