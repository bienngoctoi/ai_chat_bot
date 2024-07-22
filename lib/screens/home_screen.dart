import 'package:chat_bot/helper/global.dart';
import 'package:chat_bot/helper/pref.dart';
import 'package:chat_bot/model/home_type.dart';
import 'package:chat_bot/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _isDarkMode = Get.isDarkMode.obs;

    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {
                Get.changeThemeMode(
                    _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
                _isDarkMode.value = !_isDarkMode.value;
                Pref.isDarkMode = _isDarkMode.value;
              },
              icon: Obx(() => Icon(
                    _isDarkMode.value
                        ? Icons.brightness_2_rounded
                        : Icons.brightness_4_rounded,
                    size: 26,
                  ))),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
