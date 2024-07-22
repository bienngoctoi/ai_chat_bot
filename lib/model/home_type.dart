import 'package:chat_bot/screens/features/chat_bot_feature.dart';
import 'package:chat_bot/screens/features/image_feature.dart';
import 'package:chat_bot/screens/features/translate_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType {
  aiChatBot,
  aiImage,
  aiTranslation,
}

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatBot => "AI Chat Bot",
        HomeType.aiImage => "AI Image",
        HomeType.aiTranslation => "AI Translation",
      };
  String get lottie => switch (this) {
        HomeType.aiChatBot => "ask_ai",
        HomeType.aiImage => "imagination",
        HomeType.aiTranslation => "translate",
      };
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslation => true
      };
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => const EdgeInsets.all(20),
        HomeType.aiTranslation => EdgeInsets.zero,
      };
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => const ChatBotFeature()),
        HomeType.aiImage => () => Get.to(() => const ImageFeature()),
        HomeType.aiTranslation => () => Get.to(() => const TranslateFeature()),
      };
}
