import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_bot/helper/global.dart';
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';

class Apis {
  static Future<String> getAnswer(String question) async {
    try {
      final res =
          await post(Uri.parse("https://api.openai.com/v1/chat/completions"),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader: "Bearer $apiKey"
              },
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));
      log(question);

      final data = jsonDecode(res.body);

      log("res: $data");
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log("getAnswer: $e");
      return "Something went wrong!! Please try again";
    }
  }

  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(res.body);

      //
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }

  static Future<String> googleTranslate(
      {required String from, required String to, required String text}) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);
      return res.text;
    } catch (e) {
      log("Google Translate: $e");
      return "Something went wrong";
    }
  }
}
