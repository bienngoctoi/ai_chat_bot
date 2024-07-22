import 'package:chat_bot/helper/global.dart';
import 'package:chat_bot/main.dart';
import 'package:chat_bot/model/onboard.dart';
import 'package:chat_bot/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final list = [
      OnBoard(
          title: "Ask me anything what you want to know",
          subtitle:
              "I'm going to help you answer your question and research the issues for you!!! Ask me questions!",
          lottie: "ask_ai"),
      OnBoard(
          title: "Imagination to Reality",
          subtitle:
              "Just Imagine anything & let me know, I will create something wonderful for you!",
          lottie: "ai_hand_waving"),
    ];
    return Scaffold(
        body: PageView.builder(
            controller: controller,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final isLast = index == list.length - 1;
              return Column(
                children: [
                  Lottie.asset("assets/lottie/${list[index].lottie}.json",
                      height: mq.height * .6),
                  Text(
                    list[index].title,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5),
                  ),
                  SizedBox(
                    height: mq.height * .015,
                  ),
                  SizedBox(
                    width: mq.width * .7,
                    child: Text(list[index].subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            letterSpacing: .5,
                            color: Theme.of(context).lightTextColor)),
                  ),
                  SizedBox(
                    height: mq.height * .04,
                  ),
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                        list.length,
                        (ind) => Container(
                              width: ind == index ? 15 : 10,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: ind == index
                                      ? Colors.lightBlue
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                            )),
                  ),
                  SizedBox(
                    height: mq.height * .05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isLast) {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (_) => const HomeScreen()));
                        Get.off(() => const HomeScreen());
                      } else {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: const StadiumBorder(),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        elevation: 0,
                        minimumSize: Size(mq.width * .4, 50)),
                    child: Text(
                      isLast ? "Start" : "Next",
                    ),
                  ),
                  const Spacer(),
                ],
              );
            }));
  }
}
