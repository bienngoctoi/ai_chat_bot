import 'package:chat_bot/apis/apis.dart';
import 'package:chat_bot/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();

  final scroll = ScrollController();

  final list = <Message>[
    Message(msg: "Hello, how can i help you?", msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      list.add(Message(msg: "", msgType: MessageType.bot));

      scrollDown();
      final res = await Apis.getAnswer(textController.text);
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      scrollDown();
      textController.text = "";
    }
  }

  void scrollDown() {
    scroll.animateTo(scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
