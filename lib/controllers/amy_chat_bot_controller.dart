import 'package:aimshala/services/AMY_chat_bot/chat_bot_service.dart';
import 'package:aimshala/view/chatbot/widgets/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AmyChatBotController extends GetxController {
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ChatMessage> msgs = <ChatMessage>[].obs;
  bool isTyping = false;

  @override
  void onInit() {
    addDefaultMessage();
    super.onInit();
  }

  void addDefaultMessage() {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(now);
    String defaultMsg = "Hi I am Amy Your AI Career Guide How can i help you?";
    msgs.add(ChatMessage(false, defaultMsg, currentTime));
  }

  void sendMessage() async {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(now);
    String currentMsg = chatController.text;
    chatController.clear();
    if (currentMsg.isNotEmpty) {
      msgs.insert(0, ChatMessage(true, currentMsg, currentTime));
      isTyping = true;
    }
    scrollController.animateTo(0.0,
        duration: const Duration(seconds: 1), curve: Curves.easeOut);
    String? res = await ChatBotService().sendMessageFunction(currentMsg);
    if (res != null) {
      isTyping = false;
      msgs.insert(0, ChatMessage(false, res, currentTime));
      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.easeOut);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: 'Some error occurred, please try again!',
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
    update(['amy-chatBot']);
  }
}
