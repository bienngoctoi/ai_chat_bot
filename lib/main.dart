import 'package:chat_bot/helper/global.dart';
import 'package:chat_bot/helper/pref.dart';
import 'package:chat_bot/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.initialize();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      themeMode: Pref.defaultTheme,
      darkTheme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 1,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          )),
      home: const SplashScreen(),
    );
  }
}

extension AppTheme on ThemeData {
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan : Colors.blue;
}
