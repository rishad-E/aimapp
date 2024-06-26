import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class ChatBotService {
  Dio dio = Dio();
  String apiKey = "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";
  String path = 'https://api.openai.com/v1/chat/completions';
  String prompt =
      "Amy Prompt Name and Purpose of the Chatbot:Name: Amy Primary Purpose: Career Guidance Target Audience: School & College Students, Professionals, and business owners for their career guidanceCore Features and Functions: Answering FAQs, providing product information, conducting surveys, offering educational content of Aimshala Personality and Tone: professional, friendly, informative, humorousThe preferred tone of communication is formal, casual and educationalInteraction Flow: Greeting, identifying user needs, providing information, handling queries, closing conversations, etc.About Aimshala:Aimshala #TAKECHARGE Aimshala is an innovative platform designed to cater to the educational and career development needs of students and working professionals. It is not just an ed-tech company; it is more of an AI-driven solution for education. Aimshala offers a wide range of products and services tailored to assist individuals at various stages of their learning and career journey.Our Products and services are1. Explore:     Career Test     Career Counselling     Career Graphing     Experiential Learning2. Prepare:     Language     Academics     Entrance Exam     Govt Job Exams     Upskill Programs3. Contribute:     Book Contribution     Resource Sharing     Redemption Program4. Mentorship:     One-on-One Mentorship 5. Engage:     Webinars     Seminars     Training Programs     Workshops     Competitions6. Near You! (hyperlocal marketplace)     Coaching Institutes      tuition centres      Institutes      Colleges     Schools     Exam Preparation    * Up-Skill Programs";

  Future<String?> sendMessageFunction(String msg) async {
    try {
      Response response = await dio.post(path,
          options: Options(
            headers: {
              "Authorization": "Bearer $apiKey",
              "Content-Type": "application/json"
            },
            validateStatus: (status) => status! < 599,
          ),
          data: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "system", "content": prompt},
              {"role": "user", "content": msg}
            ],
            "temperature": 0.7,
            "max_tokens": 1000,
          }));
      if (response.statusCode == 200 && response.data != null) {
        final choices = response.data["choices"];
        if (choices != null && choices.isNotEmpty) {
          final resMsd = choices[0]["message"]["content"].toString().trim();
          if (resMsd.isNotEmpty) {
            log(resMsd, name: 'caht bot res msg');
            return resMsd;
          }
        }
      }
    } on DioException catch (e) {
      log('Dio error: ${e.message}', name: 'chat error');
      if (e.response != null) {
        log('Dio response: ${e.response}', name: 'chat error');
      }
    } catch (e) {
      log('General error: $e', name: 'chat error');
    }
    return null;
  }
}
