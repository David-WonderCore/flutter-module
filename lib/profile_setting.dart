import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

/// 這是以 Provider 來管理狀態的 Model
/// 如果未來要用 Bloc 等其他的狀態管理套件，寫法會很不一樣
/// 沒有哪個比較好，單看未來我們 Flutter architecture 會適合哪種
///


class ProfileSettingModel extends ChangeNotifier {
  ProfileSettingModel() {
    channel.setMethodCallHandler(_handleMessage);
  }

  String name = "";
  String gender = "";
  String birthday = "";
  String heightUnit = "";
  String height = "";
  String weightUnit = "";
  String weight = "";
  String bodyFat = "";

  /// 這邊是 Flutter 與 Native 通訊的 Channel
  final channel = const MethodChannel(
      'com.example.flutter_module/profile_setting');

  /// 這邊是接收 Native 傳來的資料
  Future<dynamic> _handleMessage(MethodCall call) async {
    switch (call.method) {
      case 'profile_name':
        name = call.arguments;
        /// 這邊是通知 UI 有變動
        notifyListeners();
        break;
      case 'profile_gender':
        gender = call.arguments;
        notifyListeners();
        break;
      case 'profile_birthday':
        birthday = call.arguments;
        notifyListeners();
        break;
      case 'profile_height_unit':
        heightUnit = call.arguments;
        notifyListeners();
        break;
      case 'profile_height':
        height = call.arguments;
        notifyListeners();
        break;
      case 'profile_weight_unit':
        weightUnit = call.arguments;
        notifyListeners();
        break;
      case 'profile_weight':
        weight = call.arguments;
        notifyListeners();
        break;
      case 'profile_body_fat':
        bodyFat = call.arguments;
        notifyListeners();
        break;
    }
  }
}

class _ProfileSettingState extends State<ProfileSetting> {

  @override
  Widget build(BuildContext context) {
    /// 這邊是透過 Provider 來取得 Model(其他的狀態管理套件，寫法會很不一樣)
    /// 這邊是當 Model 有變動時，會重新 build，可以針對子 View 進行更新，不用都寫在最父層
    return Consumer<ProfileSettingModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("個人資料"),
            centerTitle: true,
            leadingWidth: 100,
            leading: TextButton(onPressed: () {
              /// 這邊是傳遞資料給 Native
              model.channel.invokeMethod<void>('click_cancel');
            }, child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )
            )),
            actions: [
              TextButton(onPressed: () {
                model.channel.invokeMethod<void>('click_done');
              }, child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ))
            ],
          ),
          body: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.only(top: 34, left: 20, right: 20),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          model.channel.invokeMethod<void>('click_name');
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Theme.of(context).colorScheme.surface,
                          elevation: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "名字",
                                    style: TextStyle(
                                      color: Color(0xB353565A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Text(
                                    model.name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          model.channel.invokeMethod('click_gender');
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Theme.of(context).colorScheme.surface,
                          elevation: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "性別",
                                    style: TextStyle(
                                      color: Color(0xB353565A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Text(
                                    model.gender,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          model.channel.invokeMethod('click_birthday');
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Theme.of(context).colorScheme.surface,
                          elevation: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "生日",
                                    style: TextStyle(
                                      color: Color(0xB353565A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Text(
                                    model.birthday,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          model.channel.invokeMethod('click_height');
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Theme.of(context).colorScheme.surface,
                          elevation: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "身高",
                                    style: TextStyle(
                                      color: Color(0xB353565A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Row(
                                  children: [
                                    Text(
                                        model.height,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        )
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                        model.heightUnit,
                                        style: const TextStyle(
                                          color: Color(0x8053565A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          model.channel.invokeMethod('click_weight');
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Theme.of(context).colorScheme.surface,
                          elevation: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "體重",
                                    style: TextStyle(
                                      color: Color(0xB353565A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Row(
                                  children: [
                                    Text(
                                        model.weight,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        )
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                        model.weightUnit,
                                        style: const TextStyle(
                                          color: Color(0x8053565A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                          onTap: () {
                            model.channel.invokeMethod('click_body_fat');
                          },
                          child: Card(
                              color: Colors.white,
                              surfaceTintColor: Theme.of(context).colorScheme.surface,
                              elevation: 30,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                          "體脂率",
                                          style: TextStyle(
                                            color: Color(0xB353565A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          )
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              model.bodyFat,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                              "％",
                                              style: TextStyle(
                                                color: Color(0x8053565A),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              )
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              )
                          )
                      )
                    ],
                  )
              )
          ),
        );
      }
    );
  }
}

