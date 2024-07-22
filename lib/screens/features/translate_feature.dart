import 'package:chat_bot/controllers/image_controller.dart';
import 'package:chat_bot/controllers/translate_controller.dart';
import 'package:chat_bot/helper/global.dart';
import 'package:chat_bot/widgets/custom_button.dart';
import 'package:chat_bot/widgets/custom_loading.dart';
import 'package:chat_bot/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateFeature extends StatefulWidget {
  const TranslateFeature({super.key});

  @override
  State<TranslateFeature> createState() => _TranslateFeatureState();
}

class _TranslateFeatureState extends State<TranslateFeature> {
  final controller = TranslateController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translator"),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //from language
            InkWell(
              onTap: () => Get.bottomSheet(
                  LanguageSheet(c: controller, s: controller.from)),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 50,
                width: mq.width * .4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Obx(() => Text(
                    controller.from.isEmpty ? 'Auto' : controller.from.value)),
              ),
            ),

            //swipe language btn
            IconButton(
                onPressed: controller.swapLanguage,
                icon: Obx(
                  () => Icon(
                    CupertinoIcons.repeat,
                    color:
                        controller.to.isNotEmpty && controller.from.isNotEmpty
                            ? Colors.blue
                            : Colors.grey,
                  ),
                )),

            //to language
            InkWell(
              onTap: () => Get.bottomSheet(
                  LanguageSheet(c: controller, s: controller.to)),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 50,
                width: mq.width * .4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Obx(() =>
                    Text(controller.to.isEmpty ? 'To' : controller.to.value)),
              ),
            ),
          ]),

          //text field
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .035),
            child: TextFormField(
              controller: controller.textController,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText: 'Translate anything you want...',
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),

          //result field
          Obx(() => _translateResult()),

          //for adding some space
          SizedBox(height: mq.height * .04),

          //translate btn
          CustomButton(
            onTap: controller.googleTranslate,
            text: 'Translate',
          )
        ],
      ),
    );
  }

  Widget _translateResult() => switch (controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            child: TextFormField(
              controller: controller.resultController,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        Status.loading => const Align(
              child: CustomLoading(
            width: 100,
          ))
      };
}
