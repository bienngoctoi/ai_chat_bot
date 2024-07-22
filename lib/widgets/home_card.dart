import 'package:chat_bot/helper/global.dart';
import 'package:chat_bot/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.homeType});

  final HomeType homeType;

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
            color: Colors.blue.withOpacity(.2),
            elevation: 0,
            margin: EdgeInsets.only(bottom: mq.height * .02),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: homeType.onTap,
                child: homeType.leftAlign
                    ? Row(
                        children: [
                          Container(
                            width: mq.width * .35,
                            padding: homeType.padding,
                            child: Lottie.asset(
                                "assets/lottie/${homeType.lottie}.json",
                                height: 200,
                                width: 200),
                          ),
                          Spacer(
                            key: key,
                          ),
                          Text(
                            homeType.title,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              homeType.title,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1),
                            ),
                          ),
                          Expanded(
                            child: Lottie.asset(
                                "assets/lottie/${homeType.lottie}.json",
                                height: 200,
                                width: 200),
                          )
                        ],
                      )))
        .animate()
        .fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}
