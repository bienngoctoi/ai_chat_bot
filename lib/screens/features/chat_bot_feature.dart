import 'package:chat_bot/controllers/chat_controller.dart';
import 'package:chat_bot/helper/global.dart';
import 'package:chat_bot/main.dart';
import 'package:chat_bot/model/home_type.dart';
import 'package:chat_bot/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _chatController = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomeType.aiChatBot.title),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: const Icon(
              Icons.brightness_4_rounded,
              color: Colors.blue,
              size: 26,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _chatController.textController,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  hintText: "Ask me anything you want to know!!!",
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).buttonColor,
              child: IconButton(
                icon: const Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () => _chatController.askQuestion(),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          controller: _chatController.scroll,
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children: _chatController.list
              .map((element) => MessageCard(message: element))
              .toList(),
        ),
      ),
    );
  }
}
