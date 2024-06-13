import 'package:flutter_module/main.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class LottiePoc extends StatefulWidget {
  const LottiePoc({Key? key}) : super(key: key);

  //StatefulWidget.createState
  @override
  _LottiePoc createState() => _LottiePoc();
}

class _LottiePoc extends State<LottiePoc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //scaffold是一种布局结构，它可以让我们在屏幕上显示一些东西
      home: Scaffold(
        //center是另一种布局结构，它可以让我们在屏幕上显示一些东西
        body: Center(
            //lottie是一个动画库，它可以让我们在屏幕上显示一些动画
            child: Column(
          children: [
            Text('Hello World'),
            MemberProfile().isVip ? Text('VIP') : Text('Not VIP'),
            Text('Hello World'),
            Text('Hello World'),
            Text('Hello World'),
            Text('Hello World'),
            Lottie.asset('assets/lottie/ani_375x375_check.json'),
            MemberProfile().isVip ? Text('VIP') : Text('Not VIP'),
            MemberProfile().isVip ? Text('VIP') : Text('Not VIP'),
            MemberProfile().isVip ? Text('VIP') : Text('Not VIP'),
            MemberProfile().isVip ? Text('VIP') : Text('Not VIP'),
            MemberProfile().isVip ? Text('VIP') : Text('Not VIP'),
            //新增按鈕
            ElevatedButton(
              onPressed: () {
                debugPrint("Flutter _LottiePoc" + MemberProfile().isVip.toString());
                setState(() {
                });
              },
              child: Text('Video'),
            ),
          ],
        )
            //  Lottie.asset('assets/lottie/ani_375x375_check.json'),
            //放一個文字

            ),
      ),
    );
  }
}
