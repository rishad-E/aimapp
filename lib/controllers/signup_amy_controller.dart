import 'dart:developer';

import 'package:aimshala/view/signup/widget/amy_signup_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AmySignUpController extends GetxController {
  final String name;
  final String email;
  AmySignUpController(this.name, this.email);
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ChatMessageSignup> msgs = <ChatMessageSignup>[].obs;
  bool isTyping = false;
  bool isAskingDOB = false;
  bool isAskingGender = false;

  List<String> genders = ["Male", "Female", "Other", "Prefer not to say"];

  @override
  void onInit() {
    addDefaultMessage();
    super.onInit();
  }

  void addDefaultMessage() {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String defaultMsg =
        "Hi $name, I'm Amy, your virtual career assistant.Thanks for verifying your mobile number. Let's get to know each other better! Now, could you tell me your date of birth? (Please enter in DD/MM/YYYY format)";
    msgs.add(ChatMessageSignup(false, defaultMsg, currentTime));
    isAskingDOB = true;
  }

  void sendMessage(BuildContext context) async {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String userMessage = chatController.text;
    chatController.clear();
    // bool res = isValidDOB(userMessage);
    isAskingGender = false;
    log(isAskingGender.toString(), name: 'boooooooooooooooooooooooooool');
    if (userMessage.isNotEmpty) {
      msgs.insert(0, ChatMessageSignup(true, userMessage, currentTime));
      isTyping = false;
      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.easeOut);
      if (isAskingDOB && isValidDOB(userMessage)) {
        isAskingDOB = false;
        FocusScope.of(context).unfocus();
      }
      isTyping = true;
      String res = await replyMessageGender();
      if (res.isNotEmpty) {
        if (res == "Great! Now, could you please tell me your gender?" &&
            !isAskingGender) {
          isAskingGender = true;
        }
        msgs.insert(0, ChatMessageSignup(false, res, currentTime));
        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        isTyping = false;
        update(['send-to-amy']);
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
    }
    update(['send-to-amy']);
  }

  Future<String> replyMessageGender() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Great! Now, could you please tell me your gender?";
  }

  bool isValidDOB(String dob) {
    // Add validation logic for DOB format (DD/MM/YYYY)
    return RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dob);
  }
}
